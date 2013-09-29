class DashboardController < ApplicationController
  before_filter :sleep_data,   only: :index
  before_filter :step_data,    only: :index
  before_filter :calorie_data, only: :index
  before_filter :mood_data,    only: :index
  before_filter :weight_data,  only: :index
  before_filter :pulse_data,   only: :index

  def index
    @user = User.me
  end

  private

  def sleep_data
    sleep = Sleep.where(['user_id = ?', index.id]).last
    if sleep
      @light_sleep   = sleep.light_sleep
      @deep_sleep    = sleep.deep_sleep
      @quality_sleep = sleep.quality
    end
  end

  def step_data
    @steps = Step.where(['user_id = ?', index.id]).limit(7).order('id desc').collect{|x| x.nil? ? 0 : x.quantity}
    @steps_updated = Step.where(['user_id = ?', index.id]).last.updated_at.in_time_zone("Eastern Time (US & Canada)").strftime("%a %k:%S")
  end

  def calorie_data
    @calories = Calorie.where(['user_id = ?', index.id]).limit(7).order('id desc').collect{|x| x.nil? ? 0 : x.quantity}
    @calories_updated = Calorie.where(['user_id = ?', index.id]).last.updated_at.in_time_zone("Eastern Time (US & Canada)").strftime("%a %k:%S")
  end

  def mood_data
    mood = Mood.where(['user_id = ?', index.id]).last
    if mood
      @mood_title = mood.title
      @mood_sub_type  = mood.sub_type

      case @mood_sub_type
        when 0
          @mood_face  = "No Data"
          @mood_title = "No Data"
          @mood_scale = 8
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
          @mood_face  = "Meh"
          @mood_scale = 4
        when 5
          @mood_face  = "Dragging"
          @mood_scale = 3
        when 6
          @mood_face  = "Exhausted"
          @mood_scale = 2
        when 7
          @mood_face  = "Totally Done"
          @mood_scale = 1
        when 8
          @mood_face  = "Good"
          @mood_scale = 5
      end
    end
  end

  def weight_data
    @weights = Weight.where(['user_id = ?', index.id]).limit(7).order('id desc').collect{|x| x.nil? ? 0 : x.quantity}
    @weights_updated = Weight.where(['user_id = ?', index.id]).last.updated_at.in_time_zone("Eastern Time (US & Canada)").strftime("%a")
    @weight_updated_time = Weight.where(['user_id = ?', index.id]).last.updated_at.in_time_zone("Eastern Time (US & Canada)").strftime("%k:%S")
  end

  def pulse_data
    pulse = Pulse.where(['user_id = ?', index.id]).last
    if pulse
      @pulse = pulse.rate
      @pulse_updated_time = Pulse.where(['user_id = ?', index.id]).last.updated_at.in_time_zone("Eastern Time (US & Canada)").strftime("%a %k:%S")
    end
  end
end