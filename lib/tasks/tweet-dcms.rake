# We require the tweet code.
require 'tweet'

# We include tweet code from module.
include Tweet

task :tweet_dcms => :environment do
  puts "tweeting new answers from DCMS"
  tweet_set_up( 217 )
end