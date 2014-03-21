require 'spec_helper'

describe Progress do
  after :each do
    $redis.del($redis.keys('p*')) unless $redis.keys('p*').count == 0
  end

  it 'update should create a progress and add an item to the user list' do
    Progress.update('CHARLIE', 'SH017416530000', 'ignored', '{ "uuid":"CHARLIE", "tms_id":"SH017416530000", "position": 3612.5, "finished": false, "updated_at":"2014-03-13T21:17:09" }')
    $redis.get('p_CHARLIE_SH017416530000').should == '{ "uuid":"CHARLIE", "tms_id":"SH017416530000", "position": 3612.5, "finished": false, "updated_at":"2014-03-13T21:17:09" }'
    $redis.sismember('pu_CHARLIE', 'SH017416530000').should be_true
  end

  it 'delete should delete a progress' do
    Progress.update('CHARLIE', 'SH017416530000', 'ignored', '{ "uuid":"CHARLIE", "tms_id":"SH017416530000", "position": 3612.5, "finished": false, "updated_at":"2014-03-13T21:17:09" }')
    Progress.delete('CHARLIE', 'SH017416530000')
    $redis.get('p_CHARLIE_SH017416530000').should be_nil
  end

  it 'get should return the user progress items' do
    Progress.update('CHARLIE', 'SH017416530000', 'ignored', '{ "uuid":"CHARLIE", "tms_id":"SH017416530000", "position": 3612.5, "finished": false, "updated_at":"2014-03-13T21:17:09" }')
    Progress.update('CHARLIE', 'SH017419990000', 'ignored', '{ "uuid":"CHARLIE", "tms_id":"SH017419990000", "position": 3612.5, "finished": false, "updated_at":"2014-03-13T21:17:09" }')
    $redis.scard('pu_CHARLIE').should == 2
    Progress.get('CHARLIE').count.should == 2
  end

  it 'update the same item twice should return the single updated item for the user' do
    Progress.update('CHARLIE', 'SH017416530000', 'ignored', '{ "uuid":"CHARLIE", "tms_id":"SH017416530000", "position": 3612.5, "finished": false, "updated_at":"2014-03-13T21:17:09" }')
    Progress.update('CHARLIE', 'SH017416530000', 'ignored', '{ "uuid":"CHARLIE", "tms_id":"SH017416530000", "position": 3615.5, "finished": false, "updated_at":"2014-03-13T21:17:09" }')
    $redis.smembers('pu_CHARLIE').count.should == 1
    MultiJson.decode($redis.get('p_CHARLIE_SH017416530000'))['position'].should == 3615.5
  end

  it 'get_by_tms_id should return the user progress for a single tms_id' do
    Progress.update('CHARLIE', 'SH017416530000', 'ignored', '{ "uuid":"CHARLIE", "tms_id":"SH017416530000", "position": 3612.5, "finished": false, "updated_at":"2014-03-13T21:17:09" }')
    $redis.get('p_CHARLIE_SH017416530000').should == '{ "uuid":"CHARLIE", "tms_id":"SH017416530000", "position": 3612.5, "finished": false, "updated_at":"2014-03-13T21:17:09" }'
  end

  it 'get_by_tms_id should return nil if the user progress is empty' do
    $redis.get('p_CHARLIE_SH017416530000').should be_nil
  end

end
