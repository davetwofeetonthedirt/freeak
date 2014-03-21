class Recent
  #TODO remove redundant values from json (all models!)

  def self.update(uuid, tms_id, recent_json)
    $redis.set("c_#{uuid}_#{tms_id}", recent_json)
    $redis.sadd("cu_#{uuid}", tms_id)
  end

  def self.delete(uuid)
    $redis.del("c_#{uuid}")
    tms_ids = $redis.smembers("cu_#{uuid}")
    $redis.del(tms_ids.join(' '))
  end

  def self.delete_by_tms_id(uuid, tms_id)
    $redis.del("c_#{uuid}_#{tms_id}")
    $redis.srem("cu_#{uuid}", tms_id)
  end

  def self.get(uuid)
    tms_ids = $redis.smembers("cu_#{uuid}")
    $redis.mget(tms_ids.join(' ')).compact!
  end

  def self.get_by_tms_id(uuid, tms_id)
    $redis.get("c_#{uuid}_#{tms_id}")
  end

end
