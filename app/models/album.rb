class Album < ActiveRecord::Base
  attr_accessible :album_name, :band_id
  
  has_many :topics
  has_many :posts, :through => :topics

  belongs_to :band
end
