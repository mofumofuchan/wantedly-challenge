class GoodPoint < ApplicationRecord
#  belongs_to :said_good_point

  validates :name, presence: true
end
