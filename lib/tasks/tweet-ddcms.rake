# We require the tweet code.
require 'tweet/tweet'

# We include tweet code from module.
include TWEET

task :tweet_ddcms => :environment do
  puts "tweeting new answers from DDCMS"
  tweet_set_up( 10 )
end