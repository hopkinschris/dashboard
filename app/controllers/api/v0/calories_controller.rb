class API::V0::CaloriesController < ApplicationController
  def index
    @calories = Calorie.all
    render json: @calories
  end
end
