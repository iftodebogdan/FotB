class Album < ActiveRecord::Base
  attr_accessible :album_name, :band_id
  
  has_many :topics, :dependent => :destroy
  has_many :posts, :through => :topics, :dependent => :destroy

  belongs_to :band

  validates_length_of :album_name, :maximum => 32, :allow_blank => false
  validates :album_name, :uniqueness => true
end
