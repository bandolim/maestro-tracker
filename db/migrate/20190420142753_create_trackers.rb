class CreateTrackers < ActiveRecord::Migration[5.1]
  def change
    create_table :trackers do |t|
      t.string :equipment_name
      t.string :serial_number
      t.string :tracker_eui

      t.timestamps
    end
  end
end
