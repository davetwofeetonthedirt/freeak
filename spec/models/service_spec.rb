require 'spec_helper'

describe Service do
  around :each do
    $redis.del 's_BAKDS_DDDDD'
    $redis.del 's_BAKDS_RRRRR'
    $redis.del($redis.keys('z*').join(' '))
  end

  it 'update should create a key for the service' do
    Service.update('BAKDS', 'DDDDD', '{"bogus":"json", "full_services_json":{"receiver_id":"R451"}}')
    $redis.get('s_BAKDS_DDDDD').should == '{"bogus":"json", "full_services_json":{"receiver_id":"R451"}}'
  end

  it 'update with two receivers with the same services should create just one z service' do
    Service.update('BAKDS', 'DDDDD', '{"bogus":"json", "full_services_json":{"16777":"R451"}}')
    Service.update('BAKDS', 'RRRRR', '{"bogus":"json", "full_services_json":{"16777":"R451"}}')
    $redis.get('s_BAKDS_DDDDD').should == '{"bogus":"json", "full_services_json":{"receiver_id":"R451"}}'
    $redis.get('s_BAKDS_RRRRR').should == '{"bogus":"json", "full_services_json":{"receiver_id":"R451"}}'
    $redis.keys('z*').count.should == 1
  end

  it 'get should return the services for the user' do
    Service.update('BAKDS', 'DDDDD', '{"bogus":"json", "full_services_json":{"16777":"R451"}}')
    Service.get('BAKDS', 'DDDDD').should == '{"bogus":"json", "full_services_json":{"16777":"R451"}}'
  end
end
