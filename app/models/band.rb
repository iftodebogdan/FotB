class Band < ActiveRecord::Base
  attr_accessible :band_name

  has_many :albums
  has_many :topics, :through => :albums
  has_many :posts, :through => :topics
end
