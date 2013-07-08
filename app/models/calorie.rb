class Calorie < ActiveRecord::Base
  extend Dashboard::Jawbone

  attr_accessible :quantity

  scope :quantity, -> { last.quantity }

  def self.refresh
    new_calories
  end
end
