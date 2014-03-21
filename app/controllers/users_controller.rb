class UsersController < ApplicationController
  def create
    User.create(params[:uuid], request.body.string)
  end

  def get
    User.get(params[:uuid])
  end
end
