require 'spec_helper'

describe UsersController do
 it 'should pass through the json body on a post' do
   uuid = 'KDHWF'
   user_json = '{"something":"bogus"}'
   User.expects(:create).with(uuid, user_json)
   post :create, user_json, uuid: uuid
 end
end
