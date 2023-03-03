require 'tweetkit'

module TWEET
  
  def tweet_set_up( answering_body_id )
    
    # We up the authentication tokens as empty strings.
    consumer_key = ''
    consumer_secret = ''
    access_token = ''
    access_secret = ''
    bearer_token = ''
    
    # We check the answering body and set the oauth keys.
    case answering_body_id
    when 10
      consumer_key = ENV['DCMS_CONSUMER_KEY']
      consumer_secret = ENV['DCMS_CONSUMER_SECRET']
      access_token = ENV['DCMS_ACCESS_TOKEN']
      access_secret = ENV['DCMS_ACCESS_SECRET']
    when 60
      consumer_key = ENV['DFE_CONSUMER_KEY']
      consumer_secret = ENV['DFE_CONSUMER_SECRET']
      access_token = ENV['DFE_ACCESS_TOKEN']
      access_secret = ENV['DFE_ACCESS_SECRET']
      bearer_token = ENV['DFE_BEARER']
    when 202
      consumer_key = ENV['DIT_CONSUMER_KEY']
      consumer_secret = ENV['DIT_CONSUMER_SECRET']
      access_token = ENV['DIT_ACCESS_TOKEN']
      access_secret = ENV['DIT_ACCESS_SECRET']
    when 208
      consumer_key = ENV['FCDO_CONSUMER_KEY']
      consumer_secret = ENV['FCDO_CONSUMER_SECRET']
      access_token = ENV['FCDO_ACCESS_TOKEN']
      access_secret = ENV['FCDO_ACCESS_SECRET']
      bearer_token = ENV['FCDO_BEARER']
    when 31
      consumer_key = ENV['GEO_CONSUMER_KEY']
      consumer_secret = ENV['GEO_CONSUMER_SECRET']
      access_token = ENV['GEO_ACCESS_TOKEN']
      access_secret = ENV['GEO_ACCESS_SECRET']
      bearer_token = ENV['GEO_BEARER']
    when 211
      consumer_key = ENV['LUHC_CONSUMER_KEY']
      consumer_secret = ENV['LUHC_CONSUMER_SECRET']
      access_token = ENV['LUHC_ACCESS_TOKEN']
      access_secret = ENV['LUHC_ACCESS_SECRET']
      bearer_token = ENV['LUHC_BEARER']
    when 23
      consumer_key = ENV['OPM_CONSUMER_KEY']
      consumer_secret = ENV['OPM_CONSUMER_SECRET']
      access_token = ENV['OPM_ACCESS_TOKEN']
      access_secret = ENV['OPM_ACCESS_SECRET']
      bearer_token = ENV['OPM_BEARER']
    when 88
      #consumer_key = ENV['AG_CONSUMER_KEY']
      #consumer_secret = ENV['AG_CONSUMER_SECRET']
      #access_token = ENV['AG_ACCESS_TOKEN']
      #access_secret = ENV['AG_ACCESS_SECRET']
      bearer_token = ENV['AG_BEARER']
    when 53
      #consumer_key = ENV['CO_CONSUMER_KEY']
      #consumer_secret = ENV['CO_CONSUMER_SECRET']
      #access_token = ENV['CO_ACCESS_TOKEN']
      #access_secret = ENV['CO_ACCESS_SECRET']
      bearer_token = ENV['CO_BEARER']
    when 9
      #consumer_key = ENV['CC_CONSUMER_KEY']
      #consumer_secret = ENV['CC_CONSUMER_SECRET']
      #access_token = ENV['CC_ACCESS_TOKEN']
      #access_secret = ENV['CC_ACCESS_SECRET']
      bearer_token = ENV['CC_BEARER']
    when 13
      #consumer_key = ENV['DEFRA_CONSUMER_KEY']
      #consumer_secret = ENV['DEFRA_CONSUMER_SECRET']
      #access_token = ENV['DEFRA_ACCESS_TOKEN']
      #access_secret = ENV['DEFRA_ACCESS_SECRET']
      bearer_token = ENV['DEFRA_BEARER']
    when 27
      #consumer_key = ENV['DFT_CONSUMER_KEY']
      #consumer_secret = ENV['DFT_CONSUMER_SECRET']
      #access_token = ENV['DFT_ACCESS_TOKEN']
      #access_secret = ENV['DFT_ACCESS_SECRET']
      bearer_token = ENV['DFT_BEARER']
    when 29
      #consumer_key = ENV['DWP_CONSUMER_KEY']
      #consumer_secret = ENV['DWP_CONSUMER_SECRET']
      #access_token = ENV['DWP_ACCESS_TOKEN']
      #access_secret = ENV['DWP_ACCESS_SECRET']
      bearer_token = ENV['DWP_BEARER']
    when 17
      #consumer_key = ENV['DHSC_CONSUMER_KEY']
      #consumer_secret = ENV['DHSC_CONSUMER_SECRET']
      #access_token = ENV['DHSC_ACCESS_TOKEN']
      #access_secret = ENV['DHSC_ACCESS_SECRET']
      bearer_token = ENV['DHSC_BEARER']
    when 1
      #consumer_key = ENV['HO_CONSUMER_KEY']
      #consumer_secret = ENV['HO_CONSUMER_SECRET']
      #access_token = ENV['HO_ACCESS_TOKEN']
      #access_secret = ENV['HO_ACCESS_SECRET']
      bearer_token = ENV['HO_BEARER']
    when 18
      #consumer_key = ENV['HCC_CONSUMER_KEY']
      #consumer_secret = ENV['HCC_CONSUMER_SECRET']
      #access_token = ENV['HCC_ACCESS_TOKEN']
      #access_secret = ENV['HCC_ACCESS_SECRET']
      bearer_token = ENV['HCC_BEARER']
    when 34
      #consumer_key = ENV['LH_CONSUMER_KEY']
      #consumer_secret = ENV['LH_CONSUMER_SECRET']
      #access_token = ENV['LH_ACCESS_TOKEN']
      #access_secret = ENV['LH_ACCESS_SECRET']
      bearer_token = ENV['LH_BEARER']
    when 92
      #consumer_key = ENV['HHL_CONSUMER_KEY']
      #consumer_secret = ENV['HHL_CONSUMER_SECRET']
      #access_token = ENV['HHL_ACCESS_TOKEN']
      #access_secret = ENV['HHL_ACCESS_SECRET']
      bearer_token = ENV['HHL_BEARER']
    when 91
      #consumer_key = ENV['MEC_CONSUMER_KEY']
      #consumer_secret = ENV['MEC_CONSUMER_SECRET']
      #access_token = ENV['MEC_ACCESS_TOKEN']
      #access_secret = ENV['MEC_ACCESS_SECRET']
      bearer_token = ENV['MEC_BEARER']
    when 11
      #consumer_key = ENV['MOD_CONSUMER_KEY']
      #consumer_secret = ENV['MOD_CONSUMER_SECRET']
      #access_token = ENV['MOD_ACCESS_TOKEN']
      #access_secret = ENV['MOD_ACCESS_SECRET']
      bearer_token = ENV['MOD_BEARER']
    when 54
      #consumer_key = ENV['MOJ_CONSUMER_KEY']
      #consumer_secret = ENV['MOJ_CONSUMER_SECRET']
      #access_token = ENV['MOJ_ACCESS_TOKEN']
      #access_secret = ENV['MOJ_ACCESS_SECRET']
      bearer_token = ENV['MOJ_BEARER']
    when 21
      #consumer_key = ENV['NIO_CONSUMER_KEY']
      #consumer_secret = ENV['NIO_CONSUMER_SECRET']
      #access_token = ENV['NIO_ACCESS_TOKEN']
      #access_secret = ENV['NIO_ACCESS_SECRET']
      bearer_token = ENV['NIO_BEARER']
    when 2
      #consumer_key = ENV['SO_CONSUMER_KEY']
      #consumer_secret = ENV['SO_CONSUMER_SECRET']
      #access_token = ENV['SO_ACCESS_TOKEN']
      #access_secret = ENV['SO_ACCESS_SECRET']
      bearer_token = ENV['SO_BEARER']
    when 90
      #consumer_key = ENV['SCIPSA_CONSUMER_KEY']
      #consumer_secret = ENV['SCIPSA_CONSUMER_SECRET']
      #access_token = ENV['SCIPSA_ACCESS_TOKEN']
      #access_secret = ENV['SCIPSA_ACCESS_SECRET']
      bearer_token = ENV['SCIPSA_BEARER']
    when 204
      #consumer_key = ENV['SDS_CONSUMER_KEY']
      #consumer_secret = ENV['SDS_CONSUMER_SECRET']
      #access_token = ENV['SDS_ACCESS_TOKEN']
      #access_secret = ENV['SDS_ACCESS_SECRET']
      bearer_token = ENV['SDS_BEARER']
    when 14
      #consumer_key = ENV['HMT_CONSUMER_KEY']
      #consumer_secret = ENV['HMT_CONSUMER_SECRET']
      #access_token = ENV['HMT_ACCESS_TOKEN']
      #access_secret = ENV['HMT_ACCESS_SECRET']
      bearer_token = ENV['HMT_BEARER']
    when 28
      #consumer_key = ENV['WO_CONSUMER_KEY']
      #consumer_secret = ENV['WO_CONSUMER_SECRET']
      #access_token = ENV['WO_ACCESS_TOKEN']
      #access_secret = ENV['WO_ACCESS_SECRET']
      bearer_token = ENV['WO_BEARER']
    when 213
      #consumer_key = ENV['RANDR_CONSUMER_KEY']
      #consumer_secret = ENV['RANDR_CONSUMER_SECRET']
      #access_token = ENV['RANDR_ACCESS_TOKEN']
      #access_secret = ENV['RANDR_ACCESS_SECRET']
      bearer_token = ENV['RANDR_BEARER']
    when 214
      #consumer_key = ENV['DBT_CONSUMER_KEY']
      #consumer_secret = ENV['DBT_CONSUMER_SECRET']
      #access_token = ENV['DBT_ACCESS_TOKEN']
      #access_secret = ENV['DBT_ACCESS_SECRET']
      bearer_token = ENV['DBT_BEARER']
    when 215
      #consumer_key = ENV['DESNZ_CONSUMER_KEY']
      #consumer_secret = ENV['DESNZ_CONSUMER_SECRET']
      #access_token = ENV['DESNZ_ACCESS_TOKEN']
      #access_secret = ENV['DESNZ_ACCESS_SECRET']
      bearer_token = ENV['DESNZ_BEARER']
    when 216
      #consumer_key = ENV['DSIT_CONSUMER_KEY']
      #consumer_secret = ENV['DSIT_CONSUMER_SECRET']
      #access_token = ENV['DSIT_ACCESS_TOKEN']
      #access_secret = ENV['DSIT_ACCESS_SECRET']
      bearer_token = ENV['DSIT_BEARER']
    when 217
      #consumer_key = ENV['DCMS_CONSUMER_KEY']
      #consumer_secret = ENV['DCMS_CONSUMER_SECRET']
      #access_token = ENV['DCMS_ACCESS_TOKEN']
      #access_secret = ENV['DCMS_ACCESS_SECRET']
      bearer_token = ENV['DCMS_BEARER']
    end
    
    # We find the answering body by its MNIS ID.
    answering_body = AnsweringBody.find_by_mnis_id( answering_body_id )
    
    # We tweet answers from this answering body.
    post_status( answering_body, consumer_key, consumer_secret, access_token, access_secret, bearer_token ) if answering_body
  end
  
  # We post status updates for answers from an answering body.
  def post_status( answering_body, consumer_key, consumer_secret, access_token, access_secret, bearer_token )
  
    # We get all the answered questions from the answering body that have not yet been tweeted.
    answers = answering_body.untweeted_answers
  
    # We report the number of answers to be tweeted.
    puts "Tweeting #{answers.size} answers from #{answering_body.name}"
    
    # If we've set the Twitter credentials ...
    unless consumer_key.empty?
    
      # ... we authenticate to Twitter.
      client = Tweetkit::Client.new(
        consumer_key: consumer_key,
        consumer_secret: consumer_secret,
        access_token: access_token,
        access_token_secret: access_secret
      )
    end
  
    # For each answer ...
    answers.each do |answer|
      
      # ... we record that the answer has been tweeted.
      answer.tweeted = true
      answer.save
      
      # If we've set the Twitter credentials ...
      unless consumer_key.empty?
        
        # ... we post the tweet.
        client.post_tweet( text: answer.safe_tweet_text )
      end
      
      # If a bearer token has been passed ...
      unless bearer_token.empty?
        
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

        # ... and fetch the request.
        res = http.request(req)
      end
    end
  end
end