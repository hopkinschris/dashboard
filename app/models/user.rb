class User < ActiveRecord::Base
  attr_accessible :name,
                  :location,
                  :age,
                  :gender,
                  :height

  with_options dependent: :destroy do |user|
    has_one :mood
  end

  scope :me, -> { where(name: "Christopher Hopkins").first }
end
