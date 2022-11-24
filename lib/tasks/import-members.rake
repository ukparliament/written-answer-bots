# We require the import members code.
require 'import/import_members'

# We include import code from module.
include IMPORT_MEMBERS

# We import members.
task :import_members => :environment do
  puts "importing member data from mnis"
  import_members
end