class Band < ActiveRecord::Base
  attr_accessible :band_name

  has_many :albums, :dependent => :destroy
  has_many :topics, :through => :albums, :dependent => :destroy
  has_many :posts, :through => :topics, :dependent => :destroy
end
