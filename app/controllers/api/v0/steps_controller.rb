class API::V0::StepsController < ApplicationController
  def index
    @steps = Step.all
    render json: @steps
  end
end
