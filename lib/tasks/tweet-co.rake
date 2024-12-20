# We require the tweet code.
require 'tweet'

# We include tweet code from module.
include Tweet

task :tweet_co => :environment do
  puts "tweeting new answers from CO"
  tweet_set_up( 53 )
end