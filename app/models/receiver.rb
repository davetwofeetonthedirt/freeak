class Receiver
  def self.update(uuid, receiver_id, receiver_json)
    $redis.set("rec_#{uuid}_#{receiver_id}", receiver_json)
    #$redis.sadd("recu_#{uuid}", receiver_id)
  end

  def self.get(uuid, receiver_id)
    $redis.get("rec_#{uuid}_#{receiver_id}")
  end

end
