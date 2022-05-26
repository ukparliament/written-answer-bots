task :cleanup => :environment do
  puts "cleaning up the database"
  
  # We find all questions which have a pertinent date earlier than two weeks ago.
  questions = Question.all.where( "pertinent_date < ?", 2.weeks.ago )
  puts "Cleaning up #{questions.size} questions"
  
  # We loop through the questions ...
  questions.each do |question|
    
    # ...and destroy the record.
    question.destroy
  end
end