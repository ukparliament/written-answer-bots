task :tidy_luhc => :environment do
  
  # Get all the answered questions from LUHC.
  questions = Question.where( 'answering_body_id = 21')
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
    
    question.tweeted = false
    question.save
  end
end