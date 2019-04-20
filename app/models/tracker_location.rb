class TrackerLocation < ApplicationRecord
  belongs_to :tracker

  validates_presence_of :latitude, :longitude, :battery_level
end
