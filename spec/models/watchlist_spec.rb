require 'spec_helper'

describe Watchlist do
  after :each do
    $redis.del($redis.keys('w*')) unless $redis.keys('w*').count == 0
  end

  it 'update should create a watchlist and add an item to the user list' do
    Watchlist.update('CHARLIE', 'SH017416530000', '{ "uuid":"BAKDS", "tms_id":"SH017416530000", "created_at":"2014-03-13T21:16:59", "updated_at":"2014-03-13T21:17:09" }')
    $redis.get('w_CHARLIE_SH017416530000').should == '{ "uuid":"BAKDS", "tms_id":"SH017416530000", "created_at":"2014-03-13T21:16:59", "updated_at":"2014-03-13T21:17:09" }'
    $redis.sismember('wu_CHARLIE', 'SH017416530000').should be_true
  end

  it 'delete should delete a watchlist' do
    Watchlist.update('CHARLIE', 'SH017416530000', '{ "uuid":"BAKDS", "tms_id":"SH017416530000", "created_at":"2014-03-13T21:16:59", "updated_at":"2014-03-13T21:17:09" }')
    Watchlist.delete('CHARLIE', 'SH017416530000')
    $redis.get('w_CHARLIE').should be_nil
  end

  it 'get should return the user watchlist items' do
    Watchlist.update('CHARLIE', 'SH017416530000', '{ "uuid":"BAKDS", "tms_id":"SH017416530000", "created_at":"2014-03-13T21:16:59", "updated_at":"2014-03-13T21:17:09" }')
    Watchlist.update('CHARLIE', 'SH017419990000', '{ "uuid":"BAKDS", "tms_id":"SH017419990000", "created_at":"2014-03-13T21:16:59", "updated_at":"2014-03-13T21:17:09" }')
    $redis.scard('wu_CHARLIE').should == 2
    Watchlist.get('CHARLIE').count.should == 2
  end

  it 'update the same item twice should return a single item for the user' do
    Watchlist.update('CHARLIE', 'SH017416530000', '{ "uuid":"BAKDS", "tms_id":"SH017416530000", "created_at":"2014-03-13T21:16:59", "updated_at":"2014-03-13T21:17:09" }')
    Watchlist.update('CHARLIE', 'SH017416530000', '{ "uuid":"BAKDS", "tms_id":"SH017416530000", "created_at":"2014-03-13T21:16:59", "updated_at":"2014-03-13T21:17:09" }')
    $redis.smembers('wu_CHARLIE').count.should == 1
  end

  it 'get_by_tms_id should return the user watchlist for a single tms_id' do
    Watchlist.update('CHARLIE', 'SH017416530000', '{ "uuid":"BAKDS", "tms_id":"SH017416530000", "created_at":"2014-03-13T21:16:59", "updated_at":"2014-03-13T21:17:09" }')
    $redis.get('w_CHARLIE_SH017416530000').should == '{ "uuid":"BAKDS", "tms_id":"SH017416530000", "created_at":"2014-03-13T21:16:59", "updated_at":"2014-03-13T21:17:09" }'
  end

  it 'get_by_tms_id should return nil if the user watchlist is empty' do
    $redis.get('w_CHARLIE_SH017416530000').should be_nil
  end

end
