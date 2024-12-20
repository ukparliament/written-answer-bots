# We require the tweet code.
require 'tweet'

# We include tweet code from module.
include Tweet

task :tweet_fcdo => :environment do
  puts "tweeting new answers from FCDO"
  tweet_set_up( 208 )
end