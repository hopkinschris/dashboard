module DashboardHelper
  def mood_adjustment(mood)
    case mood.sub_type
    when 0
      mood.title = "No Data"
      return 8
    when 1
      mood.title = "Amazing!"
      return 8
    when 2
      mood.title = "Pumped UP"
      return 7
    when 3
      mood.title = "Energized"
      return 6
    when 4
      mood.title = "Meh"
      return 4
    when 5
      mood.title = "Dragging"
      return 3
    when 6
      mood.title = "Exhausted"
      return 2
    when 7
      mood.title = "Totally Done"
      return 1
    when 8
      mood.title = "Good"
      return 5
    end
  end
end
