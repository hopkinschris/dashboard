class DashboardController < ApplicationController
  before_filter :step_data,    only: :index
  before_filter :calorie_data, only: :index
  before_filter :weight_data,  only: :index

  def index
    @user = User.me
  end

  private

  def step_data
    steps = Array.new(Step.all).sort_by{ |s| s.created_at }
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
    calories = Array.new(Calorie.all).sort_by{ |c| c.created_at }
    @today_calories    = calories[-1].nil? ? 0 : calories[-1].quantity
    @minus_1_calories  = calories[-2].nil? ? 0 : calories[-2].quantity
    @minus_2_calories  = calories[-3].nil? ? 0 : calories[-3].quantity
    @minus_3_calories  = calories[-4].nil? ? 0 : calories[-4].quantity
    @minus_4_calories  = calories[-5].nil? ? 0 : calories[-5].quantity
    @minus_5_calories  = calories[-6].nil? ? 0 : calories[-6].quantity
    @minus_6_calories  = calories[-7].nil? ? 0 : calories[-7].quantity
    @calories_updated = Calorie.last.updated_at.in_time_zone("Eastern Time (US & Canada)").strftime("%a %k:%S")
  end

  def weight_data
    if Weight.last.present?
      @weights = Weight.all.sort_by{ |w| w.created_at }
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
end
