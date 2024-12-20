# We require the tweet code.
require 'tweet'

# We include tweet code from module.
include Tweet

task :tweet_dfe => :environment do
  puts "tweeting new answers from DFE"
  tweet_set_up( 60 )
end