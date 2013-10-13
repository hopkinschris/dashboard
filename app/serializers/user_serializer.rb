class UserSerializer < ActiveModel::Serializer
  has_one :mood

  attributes :id,
             :name,
             :location,
             :age,
             :gender,
             :height
end
