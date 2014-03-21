class Watchlist
  #TODO remove redundant values from json (all models!)

  def self.update(uuid, tms_id, watchlist_json)
    $redis.set("w_#{uuid}_#{tms_id}", watchlist_json)
    $redis.sadd("wu_#{uuid}", tms_id)
  end

  def self.delete(uuid, tms_id)
    $redis.del("w_#{uuid}_#{tms_id}")
    $redis.srem("wu_#{uuid}", tms_id)
  end

  def self.get(uuid)
    tms_ids = $redis.smembers("wu_#{uuid}")
    $redis.mget(tms_ids.collect{|id| "w_#{uuid}_#{id}"}) #.compact!
  end

  def self.get_by_tms_id(uuid, tms_id)
    $redis.get("w_#{uuid}_#{tms_id}")
  end

end
