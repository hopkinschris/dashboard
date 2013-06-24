class API::V0::SleepsController < ApplicationController
  def index
    @sleeps = Sleep.all
    render json: @sleeps
  end
end
