class UserSerializer < ActiveModel::Serializer
  has_one :mood
  has_one :pulse
  has_one :sleep

  attributes :id,
             :name,
             :location,
             :age,
             :gender,
             :height
end
