class Like < ActiveRecord::Base
  belongs_to :review, counter_cache: :likes_count
  belongs_to :user
end
