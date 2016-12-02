class User < ApplicationRecord
   has_many :finding_good_points, class_name: "SaidGoodPoint",
                                  foreign_key: "from_id",
                                  dependent:  :destroy

  has_secure_password
  
  validates :name, presence: true, length: { maximum: 50 },
                   uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
