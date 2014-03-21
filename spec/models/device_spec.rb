require 'spec_helper'

describe Device do
  after :each do
    $redis.del 'd_BAKDS_DDDDD'
    $redis.del 'd_BAKDS_RRRRR'
    while $redis.spop('d_BAKDS') != nil
    end
  end

  it 'register should create a key for the device and add it to the user set of devices' do
    Device.register('BAKDS', 'DDDDD', '{"bogus":"json"}')
    $redis.get('d_BAKDS_DDDDD').should == '{"bogus":"json"}'
    $redis.smembers('d_BAKDS').should == ['DDDDD']
  end

  it 'unregister should remove a key for the device and remove it from the user set of devices' do
    Device.register('BAKDS', 'DDDDD', '{"bogus":"json"}')
    Device.unregister('BAKDS', 'DDDDD')
    $redis.get('d_BAKDS_DDDDD').should == nil
    $redis.smembers('d_BAKDS').should == []
  end

  it 'info should return the devices for the user' do
    Device.register('BAKDS', 'DDDDD', '{"bogus":"json"}')
    Device.register('BAKDS', 'RRRRR', '{"bogus":"json"}')
    $redis.smembers('d_BAKDS').include?('DDDDD').should be_true
    $redis.smembers('d_BAKDS').include?('RRRRR').should be_true
  end

  it 'authorized should return true if ???'
  it 'authorized should return false if ???'

end
