# We require the import members code.
require 'import/members'

# We include import code from module.
include Import::Members

# We import members.
task :import_members => :environment do
  puts "importing member data from mnis"
  import_members
end