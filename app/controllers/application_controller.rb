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
end
