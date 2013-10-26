class RegistrationsController < Devise::RegistrationsController
  before_action :require_privilege!, except: [:new, :create]
end
