# We require the tweet code.
require 'tweet'

# We include tweet code from module.
include Tweet

task :tweet_mec => :environment do
  puts "tweeting new answers from MEC"
  tweet_set_up( 91 )
end