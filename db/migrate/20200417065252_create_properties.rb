class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :property
      t.string :rent
      t.string :address
      t.string :building_age
      t.string :remarks

      t.timestamps
    end
  end
end
