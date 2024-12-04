require 'net/http'
require 'json'
require 'uri'

module POST
  
  def post_mastodon
    
    # We up the authentication token.
    bearer_token = ENV['WRITTEN_STATEMENTS_BEARER']
    
    # We get all the written statements that have not yet been posted to Mastodon.
    written_statements = WrittenStatement.find_by_sql(
      "
        SELECT ws.*, m.display_name AS member_name, ab.name AS answering_body_name
        FROM written_statements ws, members m, answering_bodies ab
        WHERE ws.posted_to_mastodon IS FALSE
        AND ws.member_id = m.id
        AND ws.answering_body_id = ab.id
      "
    )
  
    # We report the number of written statements to be posted.
    puts "Posting #{written_statements.size} written statements"
    
    # For each written statement ...
    written_statements.each do |written_statement|
      
      # ... we encode the post text.
      post_text = written_statement.mastodon_post_text
      parser = URI::Parser.new
      post_text = parser.escape( post_text )
      
      # ... we construct the uri ...
      uri = URI( "https://mastodon.me.uk/api/v1/statuses?status=#{post_text}" )

      # ... create the client ...
      http = Net::HTTP.new( uri.host, uri.port )
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER

      # ... create  the request ...
      req =  Net::HTTP::Post.new( uri )
    
      # ... add headers ...
      req.add_field "Authorization", "Bearer #{bearer_token}"

      # ... and fetch the request.
      response = http.request(req)
      
      # If the request is successful ...
      if response.code == '200'
        
        # ... we mark the written statement as posted to Mastodon.
        written_statement.posted_to_mastodon = true
        written_statement.save!
      end
      
      # We pause for two seconds.
      sleep( 2 )
    end
  end
end

