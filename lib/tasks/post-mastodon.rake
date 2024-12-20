# We require the tweet code.
require 'post/mastodon/written_statements'

# We include tweet code from module.
include Post::Mastodon::WrittenStatements

task :post_mastodon_written_statements => :environment do
  puts "posting written statements to mastodon"
  post_mastodon
end