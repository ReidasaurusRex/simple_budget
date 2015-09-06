class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  private
  def require_login
    unless session[:user_id]
      flash[:notice] = "Please sign in"
      redirect_to "/"
    end
  end

  def get_user
    @user = User.find_by_id(session[:user_id])
    if @user
      return @user
    # else
    #   redirect to error page
    end
  end
end
