class ApplicationController < ActionController::Base
  #TODO Remove once dashboard is live and API is locked down tight
  http_basic_authenticate_with name: ENV['JAWBONE_UP_EMAIL'], password: ENV['JAWBONE_UP_PWD']
  protect_from_forgery with: :exception
end
