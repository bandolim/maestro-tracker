class Tracker < ApplicationRecord
  has_many :locations, class_name: 'TrackerLocation'

  validates_presence_of :equipment_name
  validates_uniqueness_of :tracker_eui

  def last_location
    return locations.order(id: :desc).first
  end
end
