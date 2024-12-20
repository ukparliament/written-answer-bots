# We require the tweet code.
require 'tweet'

# We include tweet code from module.
include Tweet

task :tweet_nio => :environment do
  puts "tweeting new answers from NIO"
  tweet_set_up( 21 )
end