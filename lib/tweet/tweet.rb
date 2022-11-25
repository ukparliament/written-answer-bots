require 'tweetkit'

module TWEET
  
  def tweet_set_up( answering_body_id )
    
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
    when 31
      consumer_key = ENV['GEO_CONSUMER_KEY']
      consumer_secret = ENV['GEO_CONSUMER_SECRET']
      access_token = ENV['GEO_ACCESS_TOKEN']
      access_secret = ENV['GEO_ACCESS_SECRET']
    when 211
      consumer_key = ENV['LUHC_CONSUMER_KEY']
      consumer_secret = ENV['LUHC_CONSUMER_SECRET']
      access_token = ENV['LUHC_ACCESS_TOKEN']
      access_secret = ENV['LUHC_ACCESS_SECRET']
    when 23
      consumer_key = ENV['OPM_CONSUMER_KEY']
      consumer_secret = ENV['OPM_CONSUMER_SECRET']
      access_token = ENV['OPM_ACCESS_TOKEN']
      access_secret = ENV['OPM_ACCESS_SECRET']
    end
    
    # We authenticate to Twitter.
    client = Tweetkit::Client.new(
      consumer_key: consumer_key,
      consumer_secret: consumer_secret,
      access_token: access_token,
      access_token_secret: access_secret
    )
    
    # We find the answering body by its MNIS ID.
    answering_body = AnsweringBody.find_by_mnis_id( answering_body_id )
    
    # We tweet answers from this answering body.
    tweet( answering_body, consumer_key, consumer_secret, access_token, access_secret ) if answering_body
  end
  
  # We tweet from answers from an answering body.
  def tweet( answering_body, consumer_key, consumer_secret, access_token, access_secret )
  
    # We get all the answered questions from the answering body that have not yet been tweeted.
    answers = answering_body.untweeted_answers
  
    # We report the number of answers to be tweeted.
    puts "Tweeting #{answers.size} answers from #{answering_body.name}"
  
    # We loop though all answers ...
    answers.each do |answer|
    
      # ... post the tweet ...
      client.post_tweet( text: answer.safe_tweet_text )
    
      # ... and record that the answer has been tweeted.
      answer.tweeted = true
      answer.save
    end
  end
end