class UserSerializer < ActiveModel::Serializer
  has_one :mood
  has_one :pulse
  has_one :sleep
  has_many :weights
  has_many :steps
  has_many :calories

  attributes :id,
             :name,
             :location,
             :age,
             :gender,
             :height,
             :admin
end
