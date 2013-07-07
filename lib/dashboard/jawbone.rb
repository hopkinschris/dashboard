require 'jawbone-up'

module Dashboard::Jawbone

  def jawbone_up_session
    @up = JawboneUP::Session.new
    @up.signin ENV['JAWBONE_UP_EMAIL'], ENV['JAWBONE_UP_PWD']
  end

  def new_sleep
    jawbone_up_session

    if sleep_summary = @up.get_sleep_summary
      # single value returned in 0-100 point scale from Jawbone API
      quality = sleep_summary['items'].last['details']['quality']
      # values are returned in 'seconds' format from Jawbone API
      light = sleep_summary['items'].last['details']['light']
      deep = sleep_summary['items'].last['details']['deep']
    end

    last = Sleep.last || create_sleep(light, deep, quality)

    unless (light == last.light_sleep && deep == last.deep_sleep && quality == last.quality)
      create_sleep(light, deep, quality)
    end
  end

  def new_steps
    jawbone_up_session
    #TODO
  end

  def new_mood
    jawbone_up_session

    if score = @up.get("/nudge/api/users/@me/score")
      if data = score['data']['mood']
        title = data['title']
        sub_type = data['sub_type']
      else
        title = nil
        sub_type = 0
      end
    end

    last = Mood.last || create_mood(title, sub_type)

    unless (title == last.title && sub_type == last.sub_type)
      create_mood(title, sub_type)
    end
  end

  private

  def create_sleep(light, deep, quality)
    Sleep.create(light_sleep: light, deep_sleep: deep, quality: quality)
  end

  def create_steps(quantity)
    Step.create(quantity: quantity)
  end

  def create_mood(title, sub_type)
    Mood.create(title: title, sub_type: sub_type)
  end
end
