class Pulse < ActiveRecord::Base
  extend Dashboard::WithingsAPI

  attr_accessible :rate

  def self.refresh
    new_pulse
  end
end
