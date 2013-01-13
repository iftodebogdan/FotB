class Album < ActiveRecord::Base
  attr_accessible :album_name, :band_id
  
  has_many :topics, :dependent => :destroy
  has_many :posts, :through => :topics, :dependent => :destroy

  belongs_to :band
end
