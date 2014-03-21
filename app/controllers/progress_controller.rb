class ProgressController < ApplicationController
  def get
    Progress.get(params[:uuid])
  end

  def get_by_tms_id
    Progress.get_by_tms_id(params[:uuid], params[:tms_id])
  end

  def update
    Progress.update(params[:uuid], params[:tms_id], params[:position], request.body.string)
  end

  def delete
    Progress.delete(params[:uuid], params[:tms_id])
  end
end
