class CreateStations < ActiveRecord::Migration[5.0]
  def change
    create_table :stations do |t|
      t.string :railway_line
      t.string :station_name
      t.string :minutes_walk
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
