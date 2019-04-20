class TrackerLocationsController < ApplicationController
  def show_locations
    tracker_uei = params.require(:tracker_eui)
  end

  def show_location
    tracker_uei = params.require(:tracker_eui)
  end

  def create_location
    tracker_uei = params.require(:tracker_eui)
  end

  private
  def permit_params
  end
end
