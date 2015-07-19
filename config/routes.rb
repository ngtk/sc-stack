Rails.application.routes.draw do
  root to: 'home#show'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"  }
end
