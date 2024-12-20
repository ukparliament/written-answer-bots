# We require the import members code.
require 'cleanup'

# We include import code from module.
include Cleanup

task :cleanup => :environment do
  puts "cleaning up the database"
  cleanup
end