require 'net/http'
require 'json'
require 'uri'

module TWEET

  # We set up the authentication tokens required to post to Bluesky and Mastodon for a given answering body.
  # Noting that this is the MNIS answering body ID, not the MNIS department ID.
  def tweet_set_up( answering_body_id )
    
    # We up the authentication tokens as empty strings.
    # The bearer token is used by Mastodon.
    bearer_token = ''
    # The bluesky handle and app password are used by Bluesky.
    bluesky_handle = ''
    bluesky_app_password = ''
    
    # We check the answering body ID and set the authentication tokens to constants set in Heroku.
    case answering_body_id
        
      # Attorney General.
      when 88
        bearer_token = ENV['AG_BEARER']
        bluesky_handle = ENV['AG_BLUESKY_HANDLE']
        bluesky_app_password = ENV['AG_BLUESKY_APP_PASSWORD']
        
      # Church Commissioners.
      when 9
        bearer_token = ENV['CC_BEARER']
        bluesky_handle = ENV['CC_BLUESKY_HANDLE']
        bluesky_app_password = ENV['CC_BLUESKY_APP_PASSWORD']
        
      # Culture, Media and Sport.
      when 217
        bearer_token = ENV['DCMS_BEARER']
        bluesky_handle = ENV['DCMS_BLUESKY_HANDLE']
        bluesky_app_password = ENV['DCMS_BLUESKY_APP_PASSWORD']
        
      # Cabinet Office.
      when 53
        bearer_token = ENV['CO_BEARER']
        bluesky_handle = ENV['CO_BLUESKY_HANDLE']
        bluesky_app_password = ENV['CO_BLUESKY_APP_PASSWORD']
        
      # Business and Trade.
      when 214
        bearer_token = ENV['DBT_BEARER']
        bluesky_handle = ENV['DBT_BLUESKY_HANDLE']
        bluesky_app_password = ENV['DBT_BLUESKY_APP_PASSWORD']
        
      # Department for Environment, Food and Rural Affairs.
      when 13
        bearer_token = ENV['DEFRA_BEARER']
        bluesky_handle = ENV['DEFRA_BLUESKY_HANDLE']
        bluesky_app_password = ENV['DEFRA_BLUESKY_APP_PASSWORD']
        
      # Energy Security and Net Zero.
      when 215
        bearer_token = ENV['DESNZ_BEARER']
        bluesky_handle = ENV['DESNZ_BLUESKY_HANDLE']
        bluesky_app_password = ENV['DESNZ_BLUESKY_APP_PASSWORD']
    
      # Department for Education.
      when 60
        bearer_token = ENV['DFE_BEARER']
        bluesky_handle = ENV['DFE_BLUESKY_HANDLE']
        bluesky_app_password = ENV['DFE_BLUESKY_APP_PASSWORD']
        
      # Department for Transport.
      when 27
        bearer_token = ENV['DFT_BEARER']
        bluesky_handle = ENV['DFT_BLUESKY_HANDLE']
        bluesky_app_password = ENV['DFT_BLUESKY_APP_PASSWORD']
        
      # Department of Health and Social Care.
      when 17
        bearer_token = ENV['DHSC_BEARER']
        bluesky_handle = ENV['DHSC_BLUESKY_HANDLE']
        bluesky_app_password = ENV['DHSC_BLUESKY_APP_PASSWORD']
      
      # Science, Innovation and Technology.
      when 216
        bearer_token = ENV['DSIT_BEARER']
        bluesky_handle = ENV['DSIT_BLUESKY_HANDLE']
        bluesky_app_password = ENV['DSIT_BLUESKY_APP_PASSWORD']
        
      # Department for Work and Pensions.
      when 29
        bearer_token = ENV['DWP_BEARER']
        bluesky_handle = ENV['DWP_BLUESKY_HANDLE']
        bluesky_app_password = ENV['DWP_BLUESKY_APP_PASSWORD']x
        
      # Foreign, Commonwealth and Development Office.
      when 208
        bearer_token = ENV['FCDO_BEARER']
        bluesky_handle = ENV['FCDO_BLUESKY_HANDLE']
        bluesky_app_password = ENV['FCDO_BLUESKY_APP_PASSWORD']
        
      # Women and Equalities.
      when 31
        bearer_token = ENV['GEO_BEARER']
        bluesky_handle = ENV['GEO_BLUESKY_HANDLE']
        bluesky_app_password = ENV['GEO_BLUESKY_APP_PASSWORD']
        
      # House of Commons Commission.
      when 18
        bearer_token = ENV['HCC_BEARER']
        bluesky_handle = ENV['HCC_BLUESKY_HANDLE']
        bluesky_app_password = ENV['HCC_BLUESKY_APP_PASSWORD']
        
      # Treasury.
      when 14
        bearer_token = ENV['HMT_BEARER']
        bluesky_handle = ENV['HMT_BLUESKY_HANDLE']
        bluesky_app_password = ENV['HMT_BLUESKY_APP_PASSWORD']
        
      # Home Office.
      when 1
        bearer_token = ENV['HO_BEARER']
        bluesky_handle = ENV['HO_BLUESKY_HANDLE']
        bluesky_app_password = ENV['HO_BLUESKY_APP_PASSWORD']
        
      # Leader of the House.
      when 34
        bearer_token = ENV['LH_BEARER']
        bluesky_handle = ENV['LH_BLUESKY_HANDLE']
        bluesky_app_password = ENV['LH_BLUESKY_APP_PASSWORD']
        
      # Leader of the House of Lords.
      when 92
        bearer_token = ENV['LHL_BEARER']
        bluesky_handle = ENV['LHL_BLUESKY_HANDLE']
        bluesky_app_password = ENV['LHL_BLUESKY_APP_PASSWORD']
        
      # Members Estimate Committee.
      when 91
        bearer_token = ENV['MEC_BEARER']
        bluesky_handle = ENV['MEC_BLUESKY_HANDLE']
        bluesky_app_password = ENV['MEC_BLUESKY_APP_PASSWORD']
        
      # Ministry of Housing, Communities and Local Government.
      when 7
        bearer_token = ENV['MHCLG_BEARER']
        bluesky_handle = ENV['MHCLG_BLUESKY_HANDLE']
        bluesky_app_password = ENV['MHCLG_BLUESKY_APP_PASSWORD']
        
      # Ministry of Defence.
      when 11
        bearer_token = ENV['MOD_BEARER']
        bluesky_handle = ENV['MOD_BLUESKY_HANDLE']
        bluesky_app_password = ENV['MOD_BLUESKY_APP_PASSWORD']
        
      # Ministry of Justice.
      when 54
        bearer_token = ENV['MOJ_BEARER']
        bluesky_handle = ENV['MOJ_BLUESKY_HANDLE']
        bluesky_app_password = ENV['MOJ_BLUESKY_APP_PASSWORD']
        
      # Northern Ireland Office.
      when 21
        bearer_token = ENV['NIO_BEARER']
        bluesky_handle = ENV['NIO_BLUESKY_HANDLE']
        bluesky_app_password = ENV['NIO_BLUESKY_APP_PASSWORD']
        
      # Prime Minister.
      when 23
        bearer_token = ENV['OPM_BEARER']
        bluesky_handle = ENV['OPM_BLUESKY_HANDLE']
        bluesky_app_password = ENV['OPM_BLUESKY_APP_PASSWORD']
      
      # Restoration and Renewal.
      when 213
        bearer_token = ENV['RANDR_BEARER']
        bluesky_handle = ENV['RANDR_BLUESKY_HANDLE']
        bluesky_app_password = ENV['RANDR_BLUESKY_APP_PASSWORD']
        
      # Speaker’s Committee for the Independent Parliamentary Standards Authority.
      when 90
        bearer_token = ENV['SCIPSA_BEARER']
        bluesky_handle = ENV['SCIPSA_BLUESKY_HANDLE']
        bluesky_app_password = ENV['SCIPSA_BLUESKY_APP_PASSWORD']
        
      # The Senior Deputy Speaker.
      when 204
        bearer_token = ENV['SDS_BEARER']
        bluesky_handle = ENV['SDS_BLUESKY_HANDLE']
        bluesky_app_password = ENV['SDS_BLUESKY_APP_PASSWORD']
        
      # Scotland Office.
      when 2
        bearer_token = ENV['SO_BEARER']
        bluesky_handle = ENV['SO_BLUESKY_HANDLE']
        bluesky_app_password = ENV['SO_BLUESKY_APP_PASSWORD']
        
      # Wales Office.
      when 28
        bearer_token = ENV['WO_BEARER']
        bluesky_handle = ENV['WO_BLUESKY_HANDLE']
        bluesky_app_password = ENV['WO_BLUESKY_APP_PASSWORD']
    end
    
    # We find the answering body by its MNIS ID.
    answering_body = AnsweringBody.find_by_mnis_id( answering_body_id )
    
    # We post answers from this answering body.
    post_status( answering_body, bearer_token, bluesky_handle, bluesky_app_password ) if answering_body
  end
  
  # We post status updates for answers from an answering body.
  def post_status( answering_body, bearer_token, bluesky_handle, bluesky_app_password )
  
    # We get all the answered questions from the answering body that have not yet been posted.
    answers = answering_body.untweeted_answers
  
    # We report the number of answers to be posted.
    puts "Posting #{answers.size} answers from #{answering_body.name}"
  
    # For each answer ...
    answers.each do |answer|
      
      # ... we record that the answer has been posted.
      answer.tweeted = true
      answer.save
      
      # Posting to Mastodon.
      # If a bearer token has been passed ...
      if bearer_token
        
        # ... we encode the answer text.
        answer_text = answer.safe_tweet_text
        parser = URI::Parser.new
        answer_text = parser.escape( answer_text )
        
        # ... we construct the uri ...
        uri = URI( "https://botsin.space/api/v1/statuses?status=#{answer_text}" )

        # ... create the client ...
        http = Net::HTTP.new( uri.host, uri.port )
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER

        # ... create  the request ...
        req =  Net::HTTP::Post.new( uri )
      
        # ... add headers ...
        req.add_field "Authorization", "Bearer #{bearer_token}"

        # ... and make the request.
        res = http.request(req)
      end
      
      # Posting to Bluesky.
      # If the bluesky handle has been passed ...
      if bluesky_handle
        
        # ... we attempt to authenticate.
        uri = URI( 'https://bsky.social/xrpc/com.atproto.server.createSession' )
        body = { "identifier": bluesky_handle, "password": bluesky_app_password }
        headers = { 'Content-Type': 'application/json' }
        response = Net::HTTP.post( uri, body.to_json, headers )
        
        # We grab the access tokens from the JSON response.
        access_jwt = JSON.parse( response.body )['accessJwt']
        did = JSON.parse( response.body )['did']
        
        # We construct the link facets.
        facets = create_facets( answer.safe_tweet_text )
        
        # We construct the post.
        post = {
            "$type": "app.bsky.feed.post",
            "text": answer.safe_tweet_text,
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
      end
    end
  end
  

  
  # ## A method to construct the link facet for Bluesky.
  # [ATProtocol documentation](https://atproto.com/blog/create-post#mentions-and-links)
  # [Code copied and adapted from GitHub](https://github.com/ShreyanJain9/bskyrb/issues/3)
  def create_facets( text )
    
    # We create an array to hold the facets.
    facets = []

    # We define the regex pattern to match a link.
    link_pattern = URI.regexp

    # We find the links.
    text.enum_for( :scan, link_pattern ).each do |m|
      index_start = Regexp.last_match.offset(0).first
      index_end = Regexp.last_match.offset(0).last
      facets.push(
        '$type' => 'app.bsky.richtext.facet',
        'index' => {
          'byteStart' => index_start,
          'byteEnd' => index_end,
        },
        'features' => [
          {
            '$type' => 'app.bsky.richtext.facet#link',
            'uri' => m.join("").strip.sub( 'httpsq', 'https://q' ) # this is the matched link
          },
        ],
      )
    end
    
    # We return the matched facets.
    facets
  end
end

