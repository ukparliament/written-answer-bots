# We require the import questions code.
require 'import/import_written_statements'

# We include import code from module.
include IMPORT_WRITTEN_STATEMENTS

# We import written statements.
task :import_written_statements => :environment do
  puts "importing written_statements"
  import_written_statements
end