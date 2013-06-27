class DashboardController < ApplicationController
  before_filter :sleep_data, only: :index

  def index
  end

  private

  def sleep_data
    if Sleep.last.present?
      @light_sleep   = Sleep.light
      @deep_sleep    = Sleep.deep
      @quality_sleep = Sleep.quality
    end
  end
end
