# We require the tweet code.
require 'tweet'

# We include tweet code from module.
include Tweet

task :tweet_hmt => :environment do
  puts "tweeting new answers from HMT"
  tweet_set_up( 14 )
end