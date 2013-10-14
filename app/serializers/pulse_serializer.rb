class PulseSerializer < ActiveModel::Serializer
  attributes :id,
             :date,
             :rate,
             :user_id

  def date
    "#{ object.created_at.strftime("%Y%m%d") }"
  end
end
