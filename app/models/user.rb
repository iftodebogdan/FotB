class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  # Setup accessible (or protected) attributes for your model
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  attr_accessible :login
  # attr_accessible :title, :body
  has_many :posts, :dependent => :destroy
  has_many :pms, :dependent => :destroy
  has_one :profile, :dependent => :destroy
  after_create :create_profile
  before_destroy :delete_all_pms

  validates :username, :uniqueness => true

   
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def delete_all_pms
    Pm.find(:all).each do |pm|
      if pm.sender_id == self.id or pm.user_id == self.id
        Pm.destroy(pm.id)
      end
    end
  end

### This is the correct method you override with the code above
### def self.find_for_database_authentication(warden_conditions)
### end 
end
