class ServicesController < ApplicationController
  def get
    render json: Service.get(params[:uuid], params[:receiver_id])
  end

  def update
    render json: Service.update(params[:uuid], params[:receiver_id], request.body.string)
  end
end
