# We require the tweet code.
require 'tweet/tweet'

# We include tweet code from module.
include TWEET

task :tweet_opm => :environment do
  puts "tweeting new answers from OPM"
  tweet_set_up( 23 )
end