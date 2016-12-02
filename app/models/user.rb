class User < ApplicationRecord
  #has_many :finding_good_points, classname:   "SaidGoodPoint",
  #                               foreign_key: "from",
  #                               dependente:  :destroy

  validates :name, presence: true, length: { maximum: 50 },
                   uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
