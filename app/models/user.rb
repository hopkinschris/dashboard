class User < ActiveRecord::Base
  attr_accessible :name, :location, :age, :gender, :height

  scope :me, -> { where(name: "Christopher Hopkins").first }
end
