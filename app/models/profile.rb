class Profile < ActiveRecord::Base
  attr_accessible :email, :gtalk, :location, :msn, :name, :skype, :user_id, :website, :yahoo
  
  belongs_to :user
end
