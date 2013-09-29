class Calorie < ActiveRecord::Base
  extend Dashboard::JawboneAPI

  belongs_to :user

  attr_accessible :quantity

  def self.refresh
    new_calories
  end
end
