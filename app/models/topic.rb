class Topic < ActiveRecord::Base
  attr_accessible :album_id, :band_id, :topic_name

  has_many :posts, :dependent => :destroy

  belongs_to :album
  belongs_to :band
end
