class DashboardController < ApplicationController
  before_filter :sleep_data, only: :index
  before_filter :step_data,  only: :index
  before_filter :mood_data,  only: :index

  def index
    @user = User.me
  end

  private

  def sleep_data
    if Sleep.last.present?
      @light_sleep   = Sleep.light
      @deep_sleep    = Sleep.deep
      @quality_sleep = Sleep.quality
    end
  end

  def step_data
    if Step.last.present?
      @quantity_steps = Step.quantity
    end
  end

  def mood_data
    if Mood.last.present?
      @mood_title = Mood.title
      @mood_sub_type  = Mood.sub_type
    end
  end
end
