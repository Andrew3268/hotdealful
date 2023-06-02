class Tag < ApplicationRecord
  has_and_belongs_to_many :posts
  has_and_belongs_to_many :picks
  has_and_belongs_to_many :coupons
  has_and_belongs_to_many :hotdeals
  has_and_belongs_to_many :bloggers
end
