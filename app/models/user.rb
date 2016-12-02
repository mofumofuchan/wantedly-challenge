class User < ApplicationRecord
  has_many :finding_good_point_codes, class_name:  "SaidGoodPoint",
                                      foreign_key: "from_id",
                                      dependent:   :destroy
  has_many :finding_good_points,      through:     :finding_good_point_codes,
                                      source:      :good_point

  has_many :found_good_point_codes,   class_name:  "SaidGoodPoint",
                                      foreign_key: "to_id",
                                      dependent:   :destroy
  has_many :found_good_points,        through:     :found_good_point_codes,
                                      source:      :good_point

  
  validates :name, presence: true, length: { maximum: 50 },
                   uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
