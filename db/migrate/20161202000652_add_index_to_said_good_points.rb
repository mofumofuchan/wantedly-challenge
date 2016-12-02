class AddIndexToSaidGoodPoints < ActiveRecord::Migration[5.0]
  def change
    add_index :said_good_points, :from_id
    add_index :said_good_points, :to_id
    add_index :said_good_points, :good_point_id
    add_index :said_good_points, [:from_id, :to_id, :good_point_id], unique: true
  end
end
