# We require the tweet code.
require 'tweet/tweet'

# We include tweet code from module.
include TWEET

task :tweet_hhl => :environment do
  puts "tweeting new answers from HHL"
  tweet_set_up( 34 )
end