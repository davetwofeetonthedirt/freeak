require 'redis'

$redis = Redis.new(host: REDIS_STORE_SERVER) if Rails.env.development? || Rails.env.test?
