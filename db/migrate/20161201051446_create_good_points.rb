class CreateGoodPoints < ActiveRecord::Migration[5.0]
  def change
    create_table :good_points do |t|
      t.string :name

      t.timestamps
    end
  end
end
