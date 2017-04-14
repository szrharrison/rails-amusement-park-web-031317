class UsersController < ApplicationController
  before_action :set_user , only:[:edit,:show,:update]
  before_action :logged_in?, only:[:edit,:show,:update]
  def new
    @user = User.new
  end

  def create
    @user = User.new( user_params )
    if @user.save
      session[:user_id] = @user.id
      session[:admin] = @user.admin
      redirect_to user_path( @user )
    else
      render :new
    end
  end

  def update
    if @user.update( user_params )
      redirect_to user_path( @user )
    else
      render :edit
    end
  end

  private

  def user_params
    params.require( :user ).permit( :name, :height, :happiness, :nausea, :tickets, :admin, :password )
  end
end
