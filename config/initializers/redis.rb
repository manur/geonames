require 'redis'
require 'redis/text_search'
Redis::TextSearch.redis = Redis.new(:host => 'localhost', :port => 6379)
#$redis = Redis::TextSearch.redis