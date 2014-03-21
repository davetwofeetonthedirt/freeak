class Progress
  #TODO remove redundant values from json (all models!)

  def self.update(uuid, tms_id, position, position_json)
    #TODO position is ignored
    $redis.set("p_#{uuid}_#{tms_id}", position_json)
    $redis.sadd("pu_#{uuid}", tms_id)
  end

  def self.delete(uuid, tms_id)
    $redis.del("p_#{uuid}_#{tms_id}")
    $redis.srem("pu_#{uuid}", tms_id)
  end

  def self.get(uuid)
    tms_ids = $redis.smembers("pu_#{uuid}")
    $redis.mget(tms_ids.collect{|tms_id| "p_#{uuid}_#{tms_id}"}) #.compact!
  end

  def self.get_by_tms_id(uuid, tms_id)
    $redis.get("p_#{uuid}_#{tms_id}")
  end

end
