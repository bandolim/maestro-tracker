class Tracker < ApplicationRecord
  has_many :tracker_locations

  validates_presence_of :equipment_name
  validates_uniqueness_of :tracker_eui
end
