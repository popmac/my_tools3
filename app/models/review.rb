class Review < ActiveRecord::Base
  validates :review, presence: true
  belongs_to :user
  belongs_to :tool
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  def like_user(user_id)
    self.likes.find_by(user_id: user_id)
  end
end
