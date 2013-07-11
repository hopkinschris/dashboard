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

  def new_weight
    withings_session

    ap @user.measurement_groups(device: Withings::SCALE).last
  end

  private

  def create_weight(quantity)
    Weight.create(quantity: quantity)
  end
end
