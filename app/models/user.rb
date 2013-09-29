class User < ActiveRecord::Base
  has_many :sleeps, dependent: :destroy
  has_many :steps,  dependent: :destroy
  has_many :weights,  dependent: :destroy
  has_many :calories,  dependent: :destroy
  has_one :pulse,  dependent: :destroy
  has_one :mood,  dependent: :destroy

  attr_accessible :name,
                  :location,
                  :age,
                  :gender,
                  :height

  scope :me, -> { where(name: "Christopher Hopkins").first }
end
