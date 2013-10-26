class PrivilegedSessionsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_not_privileged

  def new
  end

  private

  def ensure_not_privileged
    if privileged?
      redirect_to root_path, notice: I18n.t('privileged_session.failure.already_privileged')
    end
  end
end
