class TrackersController < ApplicationController
  def index
    @trackers = Tracker.all
    render json: response_json(response: @trackers)
  end

  def show
    tracker_eui = params.require(:tracker_eui)
    @tracker = Tracker.find_by(tracker_eui: tracker_eui)

    if @tracker
      response = response_json(response: @tracker)
    else
      response = not_found_response(id: tracker_eui)
    end

    render json: response
  end

  def create
    permitted_params = permit_params
    @tracker = Tracker.create(permitted_params)

    if @tracker.valid?
      response = response_json(response: @tracker)
    else
      message = @tracker.errors.full_messages.join(", ")
      response = response_json(success: false, message: message, response: @tracker.errors.messages)
    end

    render json: response
  end

  def destroy
    tracker_eui = params.require(:tracker_eui)
    @tracker = Tracker.find_by(tracker_eui: tracker_eui)

    if @tracker
      @tracker.destroy
      response = response_json(response: { deleted_eui: tracker_eui })
    else
      response = not_found_response(id: tracker_eui)
    end

    render json: response
  end

  private
  def permit_params
    params.permit(:equipment_name, :serial_number, :tracker_eui)
  end

end
