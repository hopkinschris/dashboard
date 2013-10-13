class UserSerializer < ActiveModel::Serializer
  has_one :mood
  has_one :pulse

  attributes :id,
             :name,
             :location,
             :age,
             :gender,
             :height
end
