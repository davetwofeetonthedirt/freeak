class ServicesController < ApplicationController
  def get
    Service.get(params[:uuid], params[:receiver_id])
  end

  def update
    Service.update(params[:uuid], params[:receiver_id], request.body.string)
  end
end
