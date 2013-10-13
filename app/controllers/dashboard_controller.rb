class DashboardController < ApplicationController
  def index
    @user = User.me
  end
end
