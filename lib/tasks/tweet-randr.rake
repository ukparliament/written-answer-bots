# We require the tweet code.
require 'tweet'

# We include tweet code from module.
include Tweet

task :tweet_randr => :environment do
  puts "tweeting new answers from R and R"
  tweet_set_up( 213 )
end