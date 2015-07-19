class Users::OmniauthCallbacksController < ApplicationController
  def soundcloud
    auth = request.env["omniauth.auth"]
    @user = User.from_omniauth(auth)

    # set_flash_message(:notice, :success, :kind => "SoundCloud") if is_navigational_format?
    sign_in_and_redirect @user, :event => :authentication
  end
end
