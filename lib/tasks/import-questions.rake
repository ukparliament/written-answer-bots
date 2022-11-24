# We require the import questions code.
require 'import/import_questions'

# We include import code from module.
include IMPORT_QUESTIONS

# We import question answers.
task :import_questions => :environment do
  puts "importing questions with answers"
  import_questions
end