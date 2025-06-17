class OauthsController < ApplicationController
  skip_before_action :require_login
  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]

    if (@user = login_from(provider))
      session[:user_id] = @user.id
      Rails.logger.debug "login_fromでログイン成功: #{@user.inspect}"
      Rails.logger.debug "session[:user_id]: #{session[:user_id]}"
      redirect_to root_path, notice: "#{provider.titleize}アカウントでログインしました"
    else
      begin
        # ユーザーが存在しない場合はプロバイダ情報を元に新規ユーザーを作成し、ログイン
        @user = signup_and_login(provider)
        session[:user_id] = @user.id
        Rails.logger.debug "signup_and_loginでログイン成功: #{@user.inspect}"
        Rails.logger.debug "session[:user_id]: #{session[:user_id]}"
        redirect_to root_path, notice: "#{provider.titleize}アカウントでログインしました"
      rescue => e
        Rails.logger.error "OAuthログイン失敗: #{e.message}"
        redirect_to root_path, alert: "#{provider.titleize}アカウントでのログインに失敗しました"
      end
    end
  end

  private

  def auth_params
    params.permit(:code, :provider)
  end

  def signup_and_login(provider)
    user = User.create_from(provider)
    reset_session
    auto_login(user)
    user
  end
end
