class Sleep < ActiveRecord::Base
  extend Dashboard::Jawbone

  attr_accessible :light_sleep, :deep_sleep, :quality

  scope :light,   -> { last.light_sleep }
  scope :deep,    -> { last.deep_sleep }
  scope :quality, -> { last.quality }

  def self.refresh
    new_sleep
  end
end
