# We require the tweet code.
require 'post/bluesky/written-statements'

# We include tweet code from module.
include POST

task :post_bluesky_written_statements => :environment do
  puts "posting written statements to bluesky"
  post_bluesky
end