require 'rubygems'
require 'nokogiri'
require 'open-uri'


task :import_members => :environment do
  puts "importing member data from mnis"
  
  doc = Nokogiri::HTML( URI.open("https://data.parliament.uk/membersdataplatform/services/mnis/members/query/house=both/addresses/") )
  
  doc.xpath("//member").each do |member|
    mnis_id = member.xpath( '@member_id' ).first.value
    display_name = member.xpath( 'displayas/text()' ).to_s
    twitter_address = member.xpath( "addresses/address[@type_id='7']/address1/text()" ).to_s
    if twitter_address
      handle = twitter_address.split( '/' ).last
      handle = handle.split( '?' ).first if handle
    end
    member = Member.find_by_mnis_id( mnis_id )
    unless member
      member = Member.new
    end
    member.mnis_id = mnis_id
    member.display_name = display_name
    member.handle = handle
    member.save
  end
end