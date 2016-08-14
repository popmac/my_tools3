class Like < ActiveRecord::Base
  belongs_to :review, counter_cache: :likes_count
  belongs_to :user
  validates :user_id, :uniqueness => {:scope => :review_id}
end
