class TrackerLocationsController < ApplicationController
  def show_locations
    tracker_eui = params.require(:tracker_eui)
    @tracker = Tracker.find_by(tracker_eui: tracker_eui)

    if @tracker
      @locations = @tracker.locations
      response = response_json(response: @locations)
    else
      response = not_found_response(id: tracker_eui)
    end

    render json: response
  end

  def show_location
    tracker_eui = params.require(:tracker_eui)
    @tracker = Tracker.find_by(tracker_eui: tracker_eui)

    if @tracker
      @location = @tracker.last_location
      response = response_json(response: @location)
    else
      response = not_found_response(id: tracker_eui)
    end

    render json: response
  end

  def create_location
    tracker_eui = params.require(:tracker_eui)
    @tracker = Tracker.find_by(tracker_eui: tracker_eui)

    if @tracker
      params_permitted = permit_params.to_hash
      params.permit!

      location = params_permitted.merge("transmission_payload" => params.to_hash)
      @location = @tracker.locations.create(location)
      if @location.valid?
        response = response_json(response: @location)
      else
        message = @location.errors.full_messages.join(", ")
        response = response_json(success: false, message: message, response: @location.errors.messages)
      end
    else
      response = not_found_response(id: tracker_eui)
    end

    render json: response
  end

  private
  def permit_params
    params.permit(:latitude, :longitude, :battery_level)
  end
end
