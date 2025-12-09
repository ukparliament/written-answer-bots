class HomeController < ApplicationController
  
  def index
    @description = 'An application to ingest written answers and written statements and make them available as RSS and through accounts on both Bluesky and Mastodon.'
  end
end
