class DevicesController < ApplicationController

  def info
    render json: Device.info(params[:uuid])
  end

  def type_info
    #TODO need spec
  end

  def authorized
    render json: Device.authorized(params[:uuid], params[:guid])
  end

  def register
    render json: Device.register(params[:uuid], params[:guid], request.body.string)
  end

  def unregister
    render json: Device.unregister(params[:uuid], params[:guid])
  end
end
