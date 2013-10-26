class PrivilegedSessionsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_not_privileged, except: [:destroy]
  before_action :require_privilege!, only: [:destroy]

  def new
  end

  def create
    if current_user.valid_password?(user_password)
      session[:privileged_session_key] = current_user.privileged_sessions.create.key
      redirect_to session[:redirect_to_privileged] || root_path, notice: I18n.t('privileged_session.success.privilege_enabled')
    else
      flash[:error] = I18n.t('privileged_session.failure.invalid_password')
      render :new
    end
  end

  def destroy
    current_user.revoke_privileges!(session[:privileged_session_key])
    redirect_to root_path, notice: I18n.t('privileged_session.success.privilege_revoked')
  end

  private

  def user_password
    params[:user] && params[:user][:password]
  end

  def ensure_not_privileged
    if privileged?
      redirect_to root_path, notice: I18n.t('privileged_session.failure.already_privileged')
    end
  end
end
