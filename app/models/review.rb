class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :tool

  validates :review, presence: true
end
