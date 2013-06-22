class SleepSerializer < ActiveModel::Serializer
  attributes :id, :light_sleep, :deep_sleep, :quality
end
