class FavoriteTrack
  include ActiveModel::Model
  include ActiveModel::Associations

  attr_accessor :user
  belongs_to :user

  def self.where(options)
    user = options.delete(:user)
    return unless user

    user.soundcloud_client.get('/me/favorites', options)
  end
end
