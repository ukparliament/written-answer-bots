# We require the tweet code.
require 'tweet'

# We include tweet code from module.
include Tweet

task :tweet_dhsc => :environment do
  puts "tweeting new answers from DHSC"
  tweet_set_up( 17 )
end