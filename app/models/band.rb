class Band < ActiveRecord::Base
  attr_accessible :band_name

  has_many :albums, :dependent => :destroy
  has_many :topics, :through => :albums, :dependent => :destroy
  has_many :posts, :through => :topics, :dependent => :destroy

  validates_length_of :band_name, :minimum => 1, :maximum => 32, :allow_blank => false
  validates :band_name, :uniqueness => true
end
