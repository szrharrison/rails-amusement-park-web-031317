class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in?, :set_user, :admin?

  private
  def logged_in?
    unless session[:user_id]
      redirect_to root_path
    end
  end

  def set_user
    if !!params[:id]
      @user = User.find( params[:id] )
    end
  end

  def admin?
    unless  session[:admin]
      redirect_to attractions_path
    end
  end
end
