require 'redis'

$redis = Redis.new(host: REDIS_STORE_SERVER)
