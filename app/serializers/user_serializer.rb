class UserSerializer < ActiveModel::Serializer
  has_one :mood
  has_one :pulse
  has_one :sleep
  has_many :weights

  attributes :id,
             :name,
             :location,
             :age,
             :gender,
             :height
end
