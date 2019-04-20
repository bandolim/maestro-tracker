class CreateTrackerLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :tracker_locations do |t|
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.decimal :battery_level, precision: 3, scale: 2
      t.json :transmission_payload
      t.references :tracker, foreign_key: true

      t.timestamps
    end
  end
end
