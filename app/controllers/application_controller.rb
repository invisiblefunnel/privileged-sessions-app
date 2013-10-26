class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def active_privileged_session
    if user_signed_in? && session[:privileged_session_key]
      @_active_privileged_session ||=
        current_user.latest_active_privileged_session(session[:privileged_session_key])
    end
  end

  def privileged?
    !!active_privileged_session
  end
end
