# We require the tweet code.
require 'tweet'

# We include tweet code from module.
include Tweet

task :tweet_dsit => :environment do
  puts "tweeting new answers from DSIT"
  tweet_set_up( 216 )
end