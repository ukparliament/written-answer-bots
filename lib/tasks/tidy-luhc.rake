task :tidy_luhc => :environment do
  
  # Get all the answered questions from LUHC.
  questions = Question.where( 'answering_body_id = 21')
  
  # Loop though all questions with answers.
  questions.each do |question|
    
    question.tweeted = false
    question.save
  end
end