require 'tweetkit'

consumer_key = ENV['GEO_CONSUMER_KEY']
consumer_secret = ENV['GEO_CONSUMER_SECRET']
access_token = ENV['GEO_ACCESS_TOKEN']
access_secret = ENV['GEO_ACCESS_SECRET']



task :tweet_geo => :environment do
  puts "tweeting new answers from GEO"
  
  # We find GEO by its MNIS ID.
  answering_body = AnsweringBody.find_by_mnis_id( 0 )
  
  # We get all the answered questions from GEO that have not yet been tweeted.
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