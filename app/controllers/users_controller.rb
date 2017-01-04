class UsersController < ApplicationController
  def show
    @users = Tweet.all.order("created_at DESC").where("text LIKE ?", "%#{params[:id]}%")
  end
end
