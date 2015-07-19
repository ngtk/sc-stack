class Users::OmniauthCallbacksController < ApplicationController
  def soundcloud
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      # set_flash_message(:notice, :success, :kind => "SoundCloud") if is_navigational_format?
    else
      session["devise.soundcloud_data"] = request.env["omniauth.auth"]
    end
  end
end
