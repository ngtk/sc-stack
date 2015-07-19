class TracksController < ApplicationController
  def index
    @tracks = current_user.favorite_tracks(limit: 10)
  end
end
