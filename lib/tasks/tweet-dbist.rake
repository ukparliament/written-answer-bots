# We require the tweet code.
require 'tweet'

# We include tweet code from module.
include Tweet

task :tweet_dbist => :environment do
  puts "tweeting new answers from DBIST"
  tweet_set_up( 220 )
end