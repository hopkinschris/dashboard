class API::V0::MoodsController < ApplicationController
  def index
    @moods = Mood.all
    render json: @moods
  end
end
