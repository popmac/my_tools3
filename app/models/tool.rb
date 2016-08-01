class Tool < ActiveRecord::Base
  has_many :reviews
  accepts_nested_attributes_for :reviews
end
