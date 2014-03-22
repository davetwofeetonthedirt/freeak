class ProgressController < ApplicationController
  def get
    render json: Progress.get(params[:uuid])
  end

  def get_by_tms_id
    render json: Progress.get_by_tms_id(params[:uuid], params[:tms_id])
  end

  def update
    render json: Progress.update(params[:uuid], params[:tms_id], params[:position], request.body.string)
  end

  def delete
    render json: Progress.delete(params[:uuid], params[:tms_id])
  end
end
