require 'spec_helper'

describe Recent do
  after :each do
    $redis.del($redis.keys('c*')) unless $redis.keys('c*').count == 0
  end

  it 'should update should create a recent for a user' do
    Recent.update('CHARLIE', 'SH017416530000', '{ "uuid":"BAKDS", "tms_id":"SH017416530000", "created_at":"2014-03-13T21:16:59" }')
    $redis.get('c_CHARLIE_SH017416530000').should == '{ "uuid":"BAKDS", "tms_id":"SH017416530000", "created_at":"2014-03-13T21:16:59" }'
    $redis.smembers('cu_CHARLIE').count.should == 1
  end

  it 'delete_by_tms_id should delete a recent' do
    Recent.update('CHARLIE', 'SH017416530000', '{ "uuid":"BAKDS", "tms_id":"SH017416530000", "created_at":"2014-03-13T21:16:59" }')
    Recent.delete_by_tms_id('CHARLIE', 'SH017416530000')
    $redis.get('c_CHARLIE').should be_nil
    $redis.get('cu_CHARLIE_SH017416530000').should be_nil
  end

  it 'delete should delete a recent' do
    Recent.update('CHARLIE', 'SH017416530000', '{ "uuid":"BAKDS", "tms_id":"SH017416530000", "created_at":"2014-03-13T21:16:59" }')
    Recent.delete_by_tms_id('CHARLIE', 'SH017416530000')
    $redis.get('c_CHARLIE').should be_nil
    $redis.get('cu_CHARLIE_SH017416530000').should be_nil
  end

  #it 'get should return the user watchlist items' do
  #  Watchlist.update('CHARLIE', 'SH017416530000', '{ "uuid":"BAKDS", "tms_id":"SH017416530000", "created_at":"2014-03-13T21:16:59" }')
  #  Watchlist.update('CHARLIE', 'SH017419990000', '{ "uuid":"BAKDS", "tms_id":"SH017419990000", "created_at":"2014-03-13T21:16:59" }')
  #  $redis.get('w_CHARLIE').count.should == 2
  #end
  #
  #it 'update the same item twice should return a single item for the user' do
  #  Watchlist.update('CHARLIE', 'SH017416530000', '{ "uuid":"BAKDS", "tms_id":"SH017416530000", "created_at":"2014-03-13T21:16:59" }')
  #  Watchlist.update('CHARLIE', 'SH017416530000', '{ "uuid":"BAKDS", "tms_id":"SH017416530000", "created_at":"2014-03-13T21:16:59" }')
  #  $redis.get('w_CHARLIE').count.should == 1
  #end
  #
  #it 'get_by_tms_id should return the user watchlist for a single tms_id' do
  #  Watchlist.update('CHARLIE', 'SH017416530000', '{ "uuid":"BAKDS", "tms_id":"SH017416530000", "created_at":"2014-03-13T21:16:59" }')
  #  $redis.get('w_CHARLIE').should == '{ "uuid":"BAKDS", "tms_id":"SH017416530000", "created_at":"2014-03-13T21:16:59" }'
  #end
  #
  #it 'get_by_tms_id should return nil if the user watchlist is empty' do
  #  $redis.get('w_CHARLIE').should be_nil
  #end

end
