class Step < ActiveRecord::Base
  extend Dashboard::JawboneAPI

  attr_accessible :quantity

  def self.refresh
    new_steps
  end
end
