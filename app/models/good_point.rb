class GoodPoint < ApplicationRecord
  has_many :said_good_point

  validates :name, presence: true, uniqueness: true
end
