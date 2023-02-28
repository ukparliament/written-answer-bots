# We require the tweet code.
require 'tweet/tweet'

# We include tweet code from module.
include TWEET

task :tweet_mod => :environment do
  puts "tweeting new answers from MOD"
  tweet_set_up( 11 )
end