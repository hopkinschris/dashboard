class API::V0::SleepsController < ApplicationController
  def index
    render json: Sleep.all
  end
end
