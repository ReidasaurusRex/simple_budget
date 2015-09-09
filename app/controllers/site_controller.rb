class SiteController < ApplicationController
  before_action :redirect_if_logged_in, only: :landing
  def landing
    @home = true # Prevent home button on page
  end

  def about
    @about = true # Prevent about link on page
  end

  private
  def redirect_if_logged_in
    redirect_to user_path(id: session[:user_id]) if session[:user_id]
  end
end
