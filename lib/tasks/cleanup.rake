# We require the import members code.
require 'import/cleanup'

# We include import code from module.
include CLEANUP

task :cleanup => :environment do
  puts "cleaning up the database"
  cleanup
end