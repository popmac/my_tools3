class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :tool
  has_many :comments, dependent: :destroy
  validates :review, presence: true
end
