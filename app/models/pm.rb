class Pm < ActiveRecord::Base
  attr_accessible :message, :read, :sender_id, :user_id

  belongs_to :user

  validate :ensure_receiver_exists

  validates_length_of :message, :minimum => 1, :allow_blank => false

  def ensure_receiver_exists
    unless User.exists?(user_id)
      errors[:User] << "does not exist"
    end
  end
end
