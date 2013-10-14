class User < ActiveRecord::Base
  attr_accessible :name,
                  :location,
                  :age,
                  :gender,
                  :height,
                  :admin

  with_options dependent: :destroy do |user|
    has_one :mood
    has_one :pulse
    has_one :sleep
    has_many :weights
    has_many :steps
    has_many :calories
  end

  scope :admin, -> { where(admin: true).first }

  def current_sleep
    Sleep.where(user: User.admin).order(:created_at).reverse_order.first
  end

  def current_mood
    Mood.where(user: User.admin).order(:created_at).reverse_order.first
  end

  def current_pulse
    Pulse.where(user: User.admin).order(:created_at).reverse_order.first
  end
end
