require 'redis'
#Redis::TextSearch.redis = Redis.new(:host => 'localhost', :port => 6379)
$redis = Redis.new(:host => 'localhost', :port => 6379)

