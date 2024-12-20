# We require the import questions code.
require 'import/questions'

# We include import code from module.
include Import::Questions

# We import question answers.
task :import_questions => :environment do
  puts "importing questions with answers"
  import_questions
end