class Topic < ActiveRecord::Base
  attr_accessible :album_id, :band_id, :topic_name

  has_many :posts, :dependent => :destroy

  belongs_to :album
  belongs_to :band

  validates_length_of :topic_name, :maximum => 32, :allow_blank => false
  validates :topic_name, :uniqueness => true
end
