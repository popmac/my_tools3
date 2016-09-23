class Review < ActiveRecord::Base
  validates :review, presence: true
  validates :rate, presence: true, :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 100, }
  validates :user_id, :uniqueness => {:scope => :tool_id}
  belongs_to :user
  belongs_to :tool
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  def like_user(user_id)
    self.likes.find_by(user_id: user_id)
  end
end
