class API::V0::PulsesController < ApplicationController
  before_filter :restrict_access

  def index
    @pulses = Pulse.all
    render json: @pulses
  end

  private

  def restrict_access
    api_key = APIKey.find_by_access_token(params[:access_token])
    head :unauthorized unless api_key
  end
end
