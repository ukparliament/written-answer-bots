# We require the tweet code.
require 'tweet/tweet'

# We include tweet code from module.
include TWEET

task :tweet_fcdo => :environment do
  puts "tweeting new answers from FCDO"
  tweet_set_up( 208 )
end