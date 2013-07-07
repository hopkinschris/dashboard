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

      case @mood_sub_type
      when 1
        @mood_face  = "Amazing!"
        @mood_scale = 8
      when 2
        @mood_face  = "Pumped UP"
        @mood_scale = 7
      when 3
        @mood_face  = "Energized"
        @mood_scale = 6
      when 4
        @mood_face  = "Good"
        @mood_scale = 5
      when 5
        @mood_face  = "Meh"
        @mood_scale = 4
      when 6
        @mood_face  = "Dragging"
        @mood_scale = 3
      when 7
        @mood_face  = "Exhausted"
        @mood_scale = 2
      when 8
        @mood_face  = "Totally Done"
        @mood_scale = 1
      end
    end
  end
end
