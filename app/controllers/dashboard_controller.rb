class DashboardController < ApplicationController
  def index
    @user = User.admin
  end
end
