# We require the import questions code.
require 'import/written_statements'

# We include import code from module.
include Import::WrittenStatements

# We import written statements.
task :import_written_statements => :environment do
  puts "importing written_statements"
  import_written_statements
end