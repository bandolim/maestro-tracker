class ApplicationController < ActionController::API

  protected

  def response_json(success: true, message: nil, response: {})
    default_message = success ? 'OK' : 'ERROR'
    message ||= default_message

    return {
      success: success,
      message: message,
      response: response
    }
  end

  def not_found_response(id:)
    default_message = "Couldn't find tracker #{id}"
    return response_json(success: false, message: default_message)
  end

end
