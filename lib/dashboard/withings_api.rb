require 'withings'

module Dashboard::WithingsAPI
  include Withings

  def withings_session
    Withings.consumer_secret = ENV['WITHINGS_OAUTH_CONSUMER_SECRET']
    Withings.consumer_key = ENV['WITHINGS_OAUTH_CONSUMER_KEY']
    user_id = ENV['WITHINGS_USER_ID']

    if response = Withings::Connection.get_request('/user', ENV['WITHINGS_OAUTH_TOKEN'], ENV['WITHINGS_OAUTH_TOKEN_SECRET'], action: :getbyuserid, userid: ENV['WITHINGS_USER_ID'])
      user_data = response['users'].detect { |item| item['id'] == user_id.to_i }
      @user = Withings::User.new(user_data.merge({oauth_token: ENV['WITHINGS_OAUTH_TOKEN'], oauth_token_secret: ENV['WITHINGS_OAUTH_TOKEN_SECRET']}))
    end
  end

  def new_weight(admin)
    @admin = admin
    withings_session
    if lbs_weight = @user.measurement_groups(measurement_type: 1).first.weight
      kg_weight = (lbs_weight*2.20462).round(2)
      if last = @admin.weights.last
        if kg_weight != last.quantity
          create_weight(kg_weight)
        end
      end
    end
  end

  def new_pulse(admin)
    @admin = admin
    withings_session
    if raw_data = @user.measurement_groups(measurement_type: 11).first
      data = raw_data.to_s
      rate = data[/.*@([^,]*)/,1].strip.to_i
      if last = @admin.pulse
        if rate != last.rate
          create_pulse(rate)
        end
      end
    end
  end

  private

  def create_weight(quantity)
    @admin.weights.build(quantity: quantity)
    @admin.save
  end

  def create_pulse(rate)
    @admin.build_pulse(rate: rate)
    @admin.save
  end
end
