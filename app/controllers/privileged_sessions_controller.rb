class PrivilegedSessionsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_not_privileged, except: :destroy

  def new
  end

  def create
    if current_user.valid_password?(params[:user][:password])
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

  def ensure_not_privileged
    if privileged?
      redirect_to root_path, notice: I18n.t('privileged_session.failure.already_privileged')
    end
  end
end
