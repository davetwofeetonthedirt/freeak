class Service
  def self.service_guid_from_full_services_json(full_services_json)
    Digest::CRC64.hexdigest(full_services_json.to_s)
  end

  def self.update(uuid, receiver_id, service_json)
    #replace the full_services_json with a pointer if it exists
    service_hash = MultiJson.decode(service_json, symbolize_keys: true)
    if service_hash.present? && service_hash[:full_services_json].present?
      service_guid = service_guid_from_full_services_json(service_hash[:full_services_json])
      unless $redis.exists("z_#{service_guid}")
        $redis.set("z_#{service_guid}", MultiJson.encode(service_hash[:full_services_json]))
      end
      service_hash[:full_services_json] = service_guid
      service_json = MultiJson.encode(service_hash)
    end

    $redis.set("s_#{uuid}_#{receiver_id}", service_json)
  end

  def self.get(uuid, receiver_id)
    service_json = $redis.get("s_#{uuid}_#{receiver_id}")
    service_hash = MultiJson.decode(service_json)
    if service_hash['full_services_json'].present?
      service_json = $redis.get("z_#{service_hash['full_services_json']}")
      service_hash['full_services_json'] = MultiJson.decode(service_json)
      service_json = MultiJson.encode(service_hash)
    end
    service_json
  end
end
