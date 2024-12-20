# We require the tweet code.
require 'tweet'

# We include tweet code from module.
include Tweet

task :tweet_so => :environment do
  puts "tweeting new answers from SO"
  tweet_set_up( 2 )
end