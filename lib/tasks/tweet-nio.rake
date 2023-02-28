# We require the tweet code.
require 'tweet/tweet'

# We include tweet code from module.
include TWEET

task :tweet_nio => :environment do
  puts "tweeting new answers from NIO"
  tweet_set_up( 21 )
end