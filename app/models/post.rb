class Post < ActiveRecord::Base
  attr_accessible :album_id, :band_id, :post_content, :topic_id, :user_id

  belongs_to :user
  belongs_to :topic
  belongs_to :album
  belongs_to :band

  validates_length_of :post_content, :minimum => 1, :maximum => 256, :allow_blank => false
end
