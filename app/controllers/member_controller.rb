class MemberController < ApplicationController
  
  def index
    @members = Member.all
    @page_title = 'Members'
    @description = 'Members'
    @crumb << {label: @page_title, url: nil}
    @section = 'members'
  end
end
