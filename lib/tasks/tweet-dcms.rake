# We require the tweet code.
require 'tweet/tweet'

# We include tweet code from module.
include TWEET

task :tweet_dcms => :environment do
  puts "tweeting new answers from DCMS"
  tweet_set_up( 10 )
end