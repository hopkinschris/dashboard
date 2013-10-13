class MoodSerializer < ActiveModel::Serializer
  attributes :id,
             :date,
             :title,
             :sub_type,
             :user_id

  def date
    "#{ object.created_at.strftime("%Y%m%d") }"
  end
end
