class WatchlistsController < ApplicationController
  def get
    render json: Watchlist.get(params[:uuid])
  end

  def get_by_tms_id
    render json: Watchlist.get_by_tms_id(params[:uuid], params[:tms_id])
  end

  def update
    render json: Watchlist.update(params[:uuid], params[:tms_id], request.body.string)
  end

  def delete
    render json: Watchlist.delete(params[:uuid], params[:tms_id])
  end

end
