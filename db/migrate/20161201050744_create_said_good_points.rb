class CreateSaidGoodPoints < ActiveRecord::Migration[5.0]
  def change
    create_table :said_good_points do |t|
      t.integer :from_id, null: false
      t.integer :to_id, null: false
      t.integer :good_point_id, null: false

      t.timestamps
    end
  end
end
