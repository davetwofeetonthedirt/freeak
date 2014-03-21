class Device
  def self.register(uuid, guid, device_json)
    $redis.set("d_#{uuid}_#{guid}", device_json)
    $redis.sadd("d_#{uuid}", guid)
  end

  def self.unregister(uuid, guid)
    $redis.del "d_#{uuid}_#{guid}"
    $redis.srem("d_#{uuid}", guid)
  end

  def self.info
    payload = []
    user_devices = $redis.smembers("d_#{uuid}")
    user_devices.each do |device_guid|
      payload << $redis.get("d_#{uuid}_#{device_guid}")
    end
    payload
  end

  def self.type_info

  end

  def self.authorized(uuid, guid)
    $redis.get("d_#{uuid}_#{guid}")
  end
end
