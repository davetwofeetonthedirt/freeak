require 'spec_helper'

describe ReceiversController do

  describe "GET 'get'" do
    it "returns http success" do
      get 'get'
      response.should be_success
    end
  end

  describe "POST 'update'" do
    it "returns http success" do
      post 'update'
      response.should be_success
    end

    it 'should pass through the json body' do
      uuid = 'KDHWF'
      receiver_id = 'R2D2'
      receiver_json = '{"something":"bogus"}'
      Receiver.expects(:update).with(uuid, receiver_id, receiver_json)
      post :update, receiver_json, uuid: uuid, receiver_id: receiver_id
    end
  end

end
