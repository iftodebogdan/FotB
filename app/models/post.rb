class Post < ActiveRecord::Base
  attr_accessible :album_id, :band_id, :post_content, :user_id
end
