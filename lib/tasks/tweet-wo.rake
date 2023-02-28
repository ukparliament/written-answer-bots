# We require the tweet code.
require 'tweet/tweet'

# We include tweet code from module.
include TWEET

task :tweet_wo => :environment do
  puts "tweeting new answers from WO"
  tweet_set_up( 28 )
end