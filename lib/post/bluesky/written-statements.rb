require 'net/http'
require 'json'
require 'uri'

module POST
  
  def post_bluesky
    
    # We up the authentication tokens.
    bluesky_handle = ENV['WRITTEN_STATEMENTS_BLUESKY_HANDLE']
    bluesky_app_password = ENV['WRITTEN_STATEMENTS_BLUESKY_APP_PASSWORD']
    
    # We get all the written statements that have not yet been posted to Bluesky.
    written_statements = WrittenStatement.find_by_sql(
      "
        SELECT ws.*, m.display_name AS member_name, ab.name AS answering_body_name
        FROM written_statements ws, members m, answering_bodies ab
        WHERE ws.posted_to_bluesky IS FALSE
        AND ws.member_id = m.id
        AND ws.answering_body_id = ab.id
      "
    )
  
    # We report the number of written statements to be posted.
    puts "Posting #{written_statements.size} written statements"
    
    # For each written statement ...
    written_statements.each do |written_statement|
      
      # ... we attempt to authenticate.
      uri = URI( 'https://bsky.social/xrpc/com.atproto.server.createSession' )
      body = { "identifier": bluesky_handle, "password": bluesky_app_password }
      headers = { 'Content-Type': 'application/json' }
      response = Net::HTTP.post( uri, body.to_json, headers )
      
      # We get the post text.
      post_text = written_statement.bluesky_post_text
      
      # We grab the access tokens from the JSON response.
      access_jwt = JSON.parse( response.body )['accessJwt']
      did = JSON.parse( response.body )['did']
      
      # We construct the link facets.
      facets = create_facets( post_text )
      
      # We construct the post.
      post = {
          "$type": "app.bsky.feed.post",
          "text": post_text,
          "createdAt": Time.now.iso8601,
          "facets": facets,
      }

      # We construct the body.
      body = {
        "repo": did,
        "collection": "app.bsky.feed.post",
        "record": post,
      }
      
      # We convert the body to JSON.
      body = body.to_json

      # We attempt to post.
      uri = URI( 'https://bsky.social/xrpc/com.atproto.repo.createRecord' )
      headers = { 'Content-Type': 'application/json', 'Authorization': "Bearer #{access_jwt}" }
      response = Net::HTTP.post( uri, body, headers )
      
      puts response.inspect
      
      # If the request is successful ...
      if response.code == '200'
        
        # ... we mark the written statement as posted to Bluesky.
        written_statement.posted_to_bluesky = true
        written_statement.save!
      end
      
      # We pause for two seconds.
      sleep( 2 )
    end
  end
end