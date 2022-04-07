require 'tweetkit'

consumer_key = ENV['FCDO_CONSUMER_KEY']
consumer_secret = ENV['FCDO_CONSUMER_SECRET']
access_token = ENV['FCDO_ACCESS_TOKEN']
access_secret = ENV['FCDO_ACCESS_SECRET']



task :tweet_fcdo => :environment do
  puts "tweeting new answers from FCDO"
  
  # We find the FCDO by its MNIS ID.
  answering_body = AnsweringBody.find_by_mnis_id( 208 )
  
  # We get all the answered questions from FCDO that have not yet been tweeted.
  answers = answering_body.untweeted_answers
  
  # We report the number of answers to be tweeted.
  puts "tweeting #{answers.size} answers"
  
  # We authenticate to Twitter.
  client = Tweetkit::Client.new(
    consumer_key: consumer_key,
    consumer_secret: consumer_secret,
    access_token: access_token,
    access_token_secret: access_secret
  )
  
  # We loop though all answers ...
  answers.each do |answer|
    
    # ... post the tweet ...
    client.post_tweet( text: question.safe_tweet_text )
    
    # ... and record that the answer has been tweeted.
    answer.tweeted = true
    answer.save
  end
end