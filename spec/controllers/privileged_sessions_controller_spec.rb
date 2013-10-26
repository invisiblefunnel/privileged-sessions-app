require 'spec_helper'

describe PrivilegedSessionsController do
  describe "DELETE :destroy" do
    before do
      @user = create(:user)
      login_user(@user)
      session[:privileged_session_key] = @user.privileged_sessions.create.key
      delete :destroy
    end

    it { should redirect_to(root_path) }
    it { should set_the_flash.to(I18n.t('privileged_session.success.privilege_revoked')) }

    it "revokes all of the current users active sessions" do
      expect(@user.privileged_sessions.active.count).to eq 0
    end
  end

  describe "POST :create" do
    before do
      session[:redirect_to_privileged] = edit_user_registration_path
    end

    context "without an authenticated user" do
      before do
        post :create, user: { password: 'password' }
      end

      it { should redirect_to(new_user_session_path) }
      it { should set_the_flash.to(I18n.t('devise.failure.unauthenticated')) }
    end

    context "with an authenticated user" do
      before do
        @user = create(:user)
        login_user(@user)
      end

      context "with an active privileged session" do
        before do
          session[:privileged_session_key] = create(:privileged_session, user: @user).key
          post :create, user: { password: 'password' }
        end

        it { should redirect_to(root_path) }
        it { should set_the_flash.to(I18n.t('privileged_session.failure.already_privileged')) }
      end

      context "without an active privileged session" do
        context "given an incorrect password" do
          before do
            post :create, user: { password: 'wrong password' }
          end

          it { should render_template(:new) }
          it { should set_the_flash.to(I18n.t('privileged_session.failure.invalid_password')) }
        end

        context "given the correct password" do
          before do
            post :create, user: { password: 'password' }
          end

          it { should redirect_to(session[:redirect_to_privileged]) }
          it { should set_the_flash.to(I18n.t('privileged_session.success.privilege_enabled')) }
        end
      end
    end
  end

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
          session[:privileged_session_key] = create(:privileged_session, user: @user).key
          get :new
        end

        it { should redirect_to(root_path) }
        it { should set_the_flash.to(I18n.t('privileged_session.failure.already_privileged')) }
      end
    end
  end
end
