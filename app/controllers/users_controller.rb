class UsersController < ApplicationController
  before_action :authenticate_user!


  def index
    @users = User.all
  end

  def show
    @articles = User.find(params[:id]).articles
  end
  
end
