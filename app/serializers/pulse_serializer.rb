class PulseSerializer < ActiveModel::Serializer
  attributes :id, :date, :rate

  def date
    "#{ object.created_at.strftime("%Y%m%d") }"
  end
end
