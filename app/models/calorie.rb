class Calorie < ActiveRecord::Base
  extend Dashboard::JawboneAPI

  attr_accessible :quantity

  def self.refresh
    new_calories
  end
end
