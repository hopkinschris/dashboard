class Weight < ActiveRecord::Base
  extend Dashboard::WithingsAPI

  attr_accessible :quantity

  scope :quantity,   -> { last.quantity }

  def self.refresh
    new_weight
  end
end
