class SessionsController < ApplicationController
  before_action :set_user, only: :index

  def new
    if session[:user_id]
      redirect_to user_path( session[:user_id] )
    end
  end

  def create
    @user = User.find_by( name: params[:user][:name] )
    if @user.authenticate( params[:user][:password] )
      session[:user_id] = @user.id
      session[:admin] = @user.admin
      session[:user_name] = @user.name
      session[:justforfun] = "this doesn't do anything"
      redirect_to user_path(@user)
    else
      render :login
    end
  end

  def index
  end

  def destroy
    session.clear
    redirect_to :root
  end
end
