class User
  def self.create(uuid, user_json)
    #user = MultiJson.decode(user_json, symbolize_keys: true)
    $redis.set("user_#{uuid}", user_json)
  end

  def self.get(uuid)
    $redis.get("user_#{uuid}")
  end
end
