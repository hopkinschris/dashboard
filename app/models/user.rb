class User < ActiveRecord::Base
  attr_accessible :name,
                  :location,
                  :age,
                  :gender,
                  :height

  with_options dependent: :destroy do |user|
    has_one :mood
    has_one :pulse
    has_one :sleep
    has_many :weights
    has_many :steps
  end

  scope :me, -> { where(name: "Christopher Hopkins").first }
end
