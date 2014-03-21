class Receiver
  def self.update(uuid, receiver_id, receiver_json)
    $redis.set("r_#{receiver_id}", receiver_json)
    #$redis.sadd("ur_#{uuid}", receiver_id)
  end

  def self.get(uuid, receiver_id)
    $redis.get("r_#{receiver_id}")
  end

end
