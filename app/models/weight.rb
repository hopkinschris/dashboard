class Weight < ActiveRecord::Base
  extend Dashboard::WithingsAPI

  belongs_to :user

  attr_accessible :quantity

  def self.refresh
    new_weight(User.admin)
  end
end
