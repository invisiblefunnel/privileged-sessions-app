module AuthenticationHelpers
  def login_user(user = nil)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user ||= create(:user)
    sign_in user
  end
end

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.include AuthenticationHelpers, type: :controller
end
