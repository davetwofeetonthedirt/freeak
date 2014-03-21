class WatchlistsController < ApplicationController
  def get
    Watchlist.get(params[:uuid])
  end

  def get_by_tms_id
    Watchlist.get_by_tms_id(params[:uuid], params[:tms_id])
  end

  def update
    Watchlist.update(params[:uuid], params[:tms_id], request.body.string)
  end

  def delete
    Watchlist.delete(params[:uuid], params[:tms_id])
  end

end
