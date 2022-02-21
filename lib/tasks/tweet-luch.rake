require 'tweetkit'

consumer_key = ENV['LUCH_CONSUMER_KEY']
consumer_secret = ENV['LUCH_CONSUMER_SECRET']
access_token = ENV['LUCH_ACCESS_TOKEN']
access_secret = ENV['LUCH_ACCESS_SECRET']



task :tweet_luch => :environment do
  puts "tweeting new answers from LUCH"
  
  # Get all the answered questions from LUCH that have not yet been tweeted.
  questions = Question.where( 'answering_body_id = 21').where( tweeted: false )
  puts "tweeting #{questions.size} questions"
  
  # Authenticate
  client = Tweetkit::Client.new(
    consumer_key: consumer_key,
    consumer_secret: consumer_secret,
    access_token: access_token,
    access_token_secret: access_secret
  )
  
  # Loop though all questions with answers.
  questions.each do |question|
    
    client.post_tweet( text: question.safe_tweet_text )
    question.tweeted = true
    question.save
  end
end