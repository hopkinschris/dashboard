require 'jawbone-up'

class DashboardController < ApplicationController
  before_filter :jawbone_up_session, only: [:index]
  before_filter :sleep, only: [:index]

  def index
  end

  private

  def jawbone_up_session
    @up = JawboneUP::Session.new
    @up.signin ENV['JAWBONE_UP_EMAIL'], ENV['JAWBONE_UP_PWD']
  end

  def sleep
    sleep_summary = @up.get_sleep_summary
    # single value returned in 0-100 point scale from Jawbone API
    @quality = sleep_summary['items'].last['details']['quality']
    # values are returned in 'seconds' format from Jawbone API
    @light = sleep_summary['items'].last['details']['light']
    @deep = sleep_summary['items'].last['details']['deep']
    @total = @light + @deep
  end
end
