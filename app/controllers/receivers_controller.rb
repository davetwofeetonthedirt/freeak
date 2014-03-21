class ReceiversController < ApplicationController
  def get
    Receiver.get(params[:uuid], params[:receiver_id])
  end

  def update
    Receiver.update(params[:uuid], params[:receiver_id], request.body.string)
  end
end
