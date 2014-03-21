require 'spec_helper'

describe Receiver do
  after :each do
    $redis.del($redis.keys('rec*')) unless $redis.keys('rec*').count == 0
  end

  it 'should create a key for the receiver' do
    Receiver.update('BAKDS', 'R123908', '{"bogus":"json"}')
    $redis.get('rec_BAKDS_R123908').should == '{"bogus":"json"}'
  end

  it 'should return the json for the uuid' do
    Receiver.update('BAKDS', 'R123908', '{"bogus":"json"}')
    Receiver.get('BAKDS', 'R123908').should == '{"bogus":"json"}'
  end
end


