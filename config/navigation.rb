SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.dom_class = 'nav navbar-nav'

    # ログイン前
    primary.item :sign_in, 'Sign In', new_user_session_path, unless: -> { user_signed_in? }
    primary.item :sign_up, 'Sign Up', new_user_registration_path, unless: -> { user_signed_in? }

    # ログイン後
    primary.item :tracks, 'Tracks', tracks_path, if: -> { user_signed_in? }
    primary.item :user, current_user.try(:name), edit_user_registration_path, if: -> { user_signed_in? } do |sub|
      sub.item :logout, 'Account', edit_user_registration_path
      sub.item :divider, '', class: 'divider'
      sub.item :logout, 'Logout', destroy_user_session_path, method: :delete
    end
  end
end
