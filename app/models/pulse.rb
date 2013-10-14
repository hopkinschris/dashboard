class Pulse < ActiveRecord::Base
  extend Dashboard::WithingsAPI

  belongs_to :user

  attr_accessible :rate

  def self.refresh
    new_pulse(User.admin)
  end
end
