class MetaController < ApplicationController

  def index
    @page_title = 'About this website'
    @description = 'About this website.'
    @crumb << {label: @page_title, url: nil}
  end

  def cookies
    @page_title = 'Cookies'
    @description = 'Cookie policy.'
    @crumb << {label: 'About this website', url: meta_list_url}
    @crumb << {label: 'Cookies', url: nil}
    
    render 'library_design/meta/cookies'
  end
end
