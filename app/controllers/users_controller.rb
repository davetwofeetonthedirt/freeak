class UsersController < ApplicationController
  def create
    render json: User.create(params[:uuid], request.body.string)
  end

  def get
    render json: User.get(params[:uuid])
  end
end
