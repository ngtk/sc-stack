SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.dom_class = 'nav navbar-nav'

    primary.item :sign_in, 'Sign In', new_user_session_path
    primary.item :sign_up, 'Sign Up', new_user_registration_path
  end
end
