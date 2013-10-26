require 'spec_helper'

describe PrivilegedSessionsController do
  describe "GET :new" do
    context "without an authenticated user" do
      before do
        get :new
      end

      it { should redirect_to(new_user_session_path) }
      it { should set_the_flash.to(I18n.t('devise.failure.unauthenticated')) }
    end

    context "with an authenticated user" do
      before do
        @user = create(:user)
        login_user(@user)
      end

      context "without an active privileged session" do
        before do
          get :new
        end

        it { should respond_with(:success) }
        it { should render_template(:new) }
      end

      context "with an active privileged session" do
        before do
          privileged_session = create(:privileged_session, user: @user)
          session[:privileged_session_key] = privileged_session.key
          get :new
        end

        it { should redirect_to(root_path) }
        it { should set_the_flash.to(I18n.t('privileged_session.failure.already_privileged')) }
      end
    end
  end
end
