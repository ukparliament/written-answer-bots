class ApplicationController < ActionController::Base
	rescue_from ActiveRecord::RecordNotFound, with: :render_404

  include LibraryDesign::Crumbs
  
  $SITE_TITLE = 'Written Statements and Answers'
  
  $DATE_DISPLAY_FORMAT = '%-d %B %Y'
  
  $TOGGLE_PORTCULLIS = ENV.fetch( "TOGGLE_PORTCULLIS", 'off' )

	def render_404
		render file: "public/404.html", status: :not_found, layout: false
	end
end
