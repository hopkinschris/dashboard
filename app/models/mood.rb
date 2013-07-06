class Mood < ActiveRecord::Base
  extend Dashboard::Jawbone

  attr_accessible :title, :sub_type

  scope :title,       -> { last.title }
  scope :sub_type,    -> { last.sub_type }

  def self.refresh
    new_mood
  end
end
