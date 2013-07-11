class DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['JAWBONE_UP_EMAIL'], password: ENV['JAWBONE_UP_PWD'] if Rails.env.production?
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
    if Sleep.last.present?
      @light_sleep   = Sleep.light
      @deep_sleep    = Sleep.deep
      @quality_sleep = Sleep.quality
    end
  end

  def step_data
    steps = Array.new(Step.all)
    @today_steps   = steps[-1].nil? ? 0 : steps[-1].quantity
    @minus_1_steps = steps[-2].nil? ? 0 : steps[-2].quantity
    @minus_2_steps = steps[-3].nil? ? 0 : steps[-3].quantity
    @minus_3_steps = steps[-4].nil? ? 0 : steps[-4].quantity
    @minus_4_steps = steps[-5].nil? ? 0 : steps[-5].quantity
    @minus_5_steps = steps[-6].nil? ? 0 : steps[-6].quantity
    @minus_6_steps = steps[-7].nil? ? 0 : steps[-7].quantity
    @steps_updated = Step.last.updated_at.in_time_zone("Eastern Time (US & Canada)").strftime("%a %k:%S")
  end

  def calorie_data
    calories = Array.new(Calorie.all)
    @today_calories    = calories[-1].nil? ? 0 : calories[-1].quantity
    @minus_1_calories  = calories[-2].nil? ? 0 : calories[-2].quantity
    @minus_2_calories  = calories[-3].nil? ? 0 : calories[-3].quantity
    @minus_3_calories  = calories[-4].nil? ? 0 : calories[-4].quantity
    @minus_4_calories  = calories[-5].nil? ? 0 : calories[-5].quantity
    @minus_5_calories  = calories[-6].nil? ? 0 : calories[-6].quantity
    @minus_6_calories  = calories[-7].nil? ? 0 : calories[-7].quantity
    @calories_updated = Calorie.last.updated_at.in_time_zone("Eastern Time (US & Canada)").strftime("%a %k:%S")
  end

  def mood_data
    if Mood.last.present?
      @mood_title = Mood.title
      @mood_sub_type  = Mood.sub_type

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
    if Weight.last.present?
      @weights = Weight.all
      @today_weight   = @weights.last(1).nil? ? 0 : @weights.last(1).first.quantity
      @minus_1_weight = @weights.last(2).nil? ? 0 : @weights.last(2).first.quantity
      @minus_2_weight = @weights.last(3).nil? ? 0 : @weights.last(3).first.quantity
      @minus_3_weight = @weights.last(4).nil? ? 0 : @weights.last(4).first.quantity
      @minus_4_weight = @weights.last(5).nil? ? 0 : @weights.last(5).first.quantity
      @minus_5_weight = @weights.last(6).nil? ? 0 : @weights.last(6).first.quantity
      @minus_6_weight = @weights.last(7).nil? ? 0 : @weights.last(7).first.quantity
      @weight_updated_day = Weight.last.updated_at.in_time_zone("Eastern Time (US & Canada)").strftime("%a")
      @weight_updated_time = Weight.last.updated_at.in_time_zone("Eastern Time (US & Canada)").strftime("%k:%S")
    end
  end

  def pulse_data
    if Pulse.last.present?
      @pulse = Pulse.last.rate
      @pulse_updated_time = Pulse.last.updated_at.in_time_zone("Eastern Time (US & Canada)").strftime("%a %k:%S")
    else
      @pulse = 0
      @pulse_updated_time = "—"
    end
  end
end
