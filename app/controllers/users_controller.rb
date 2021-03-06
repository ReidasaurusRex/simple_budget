class UsersController < ApplicationController
  before_action :get_user, except: [:new, :create]
  before_action :get_week_budget, only: :show
  before_action :get_month_budget, only: :show
  before_action :require_login, except: [:new, :create]
  def new
  end

  def create
    create_user(user_params)
  end

  def show
    @home = true # Prevent home button on page
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end



  private
  def user_params
    params.require(:user).permit(:id, :username, :email, :password, :password_confirmation, :password_digest)
  end

  def create_user(new_user_params)
    @user = User.new(new_user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @user.destroy
      flash[:notice] = @user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end
end
