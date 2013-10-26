class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :privileged?

  private

  def require_privilege!
    unless privileged?
      session[:redirect_to_privileged] = request.path
      flash[:warning] = I18n.t('privileged_session.failure.privilege_required')
      redirect_to new_privileged_session_path
    end
  end

  def privileged?
    return @_privileged if defined?(@_privileged)
    @_privileged = user_signed_in? && current_user.privileged?(session[:privileged_session_key])
  end
end
