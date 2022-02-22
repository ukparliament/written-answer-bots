require 'tweetkit'

consumer_key = ENV['LUHC_CONSUMER_KEY']
consumer_secret = ENV['LUHC_CONSUMER_SECRET']
access_token = ENV['LUHC_ACCESS_TOKEN']
access_secret = ENV['LUHC_ACCESS_SECRET']



task :tweet_luhc => :environment do
  puts "tweeting new answers from LUHC"
  
  # Get all the answered questions from LUHC that have not yet been tweeted.
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