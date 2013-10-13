class WeightSerializer < ActiveModel::Serializer
  attributes :id,
             :date,
             :quantity,
             :user_id

  def date
    "#{ object.created_at.strftime("%Y%m%d") }"
  end
end
