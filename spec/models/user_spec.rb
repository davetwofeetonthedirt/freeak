require 'spec_helper'

describe User do
  after :each do
    $redis.del 'user_BAKDS'
  end

  it 'should create a key for the user' do
    User.create('BAKDS', '{"bogus":"json"}')
    $redis.get('user_BAKDS').should == '{"bogus":"json"}'
  end

  it 'should return the json for the uuid' do
    User.create('BAKDS', '{"bogus":"json"}')
    User.get('BAKDS').should == '{"bogus":"json"}'
  end
end
