class ReceiversController < ApplicationController
  def get
    render json: Receiver.get(params[:uuid], params[:receiver_id])
  end

  def update
    render json: Receiver.update(params[:uuid], params[:receiver_id], request.body.string)
  end
end
