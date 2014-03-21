class DevicesController < ApplicationController

  def info
    Device.info(params[:uuid])
  end

  def type_info
    #TODO need spec
  end

  def authorized
    Device.authorized(params[:uuid], params[:guid])
  end

  def register
    Device.register(params[:uuid], params[:guid], request.body.string)
  end

  def unregister
    Device.unregister(params[:uuid], params[:guid])
  end
end
