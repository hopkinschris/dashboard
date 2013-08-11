class User < ActiveRecord::Base
  has_many :sleeps, dependent: :destroy
  has_many :steps,  dependent: :destroy

  attr_accessible :name,
                  :location,
                  :age,
                  :gender,
                  :height

  scope :me, -> { where(name: "Christopher Hopkins").first }
end
