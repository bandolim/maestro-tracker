Rails.application.routes.draw do
  get '/trackers', to: 'trackers#index'
  post '/trackers', to: 'trackers#create'
  get '/trackers/:tracker_eui', to: 'trackers#show'
  delete '/trackers/:tracker_eui', to: 'trackers#destroy'

  # locations
  get '/trackers/:tracker_eui/locations', to: 'tracker_locations#show_locations'
  get '/trackers/:tracker_eui/location', to: 'tracker_locations#show_location'
  post '/trackers/:tracker_eui/location', to: 'tracker_locations#create_location'
end
