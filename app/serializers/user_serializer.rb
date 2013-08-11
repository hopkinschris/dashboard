class UserSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :location,
             :age,
             :gender,
             :height,
             :sleeps
end
