# We require the tweet code.
require 'tweet'

# We include tweet code from module.
include Tweet

task :tweet_mhclg => :environment do
  puts "tweeting new answers from MHCLG"
  tweet_set_up( 7 )
end