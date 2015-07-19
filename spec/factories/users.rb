FactoryGirl.define do
  factory :user do
    name 'Mark Zak'
    email { "user_#{SecureRandom.hex(8)}@test.sc-stack.com" }
    password 'password'
    password_confirmation 'password'

    trait :with_soundcloud do
      provider 'soundcloud'
      uid      { SecureRandom.hex(12) }
      token    { SecureRandom.hex(16) }
    end
  end
end
