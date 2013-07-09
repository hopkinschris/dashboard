class API::V0::StepsController < ApplicationController
  before_filter :restrict_access

  def index
    @steps = Step.all
    render json: @steps
  end

  private

  def restrict_access
    api_key = APIKey.find_by_access_token(params[:access_token])
    head :unauthorized unless api_key
  end
end
