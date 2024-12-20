# We require the tweet code.
require 'tweet'

# We include tweet code from module.
include Tweet

task :tweet_cc => :environment do
  puts "tweeting new answers from CC"
  tweet_set_up( 9 )
end