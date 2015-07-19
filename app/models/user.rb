class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:soundcloud]

  attr_encrypted :token, key: Rails.application.secrets.secret_key_base

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.password = Devise.friendly_token[0,20]
      user.token = auth.credentials.token
      user.name = auth.info.name
    end
  end

  def email_required?
    !omniauth? && super
  end

  private

  def omniauth?
    provider.present? && uid.present?
  end
end
