class UsersController < ApplicationController
  before_action :get_user, except: [:new, :create]

  def new
  end

  def create
    create_user(user_params)
  end

  def show
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
      flash[:alert] = @user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end

  def get_user
    @user = User.find_by_id(params[:id])
    if @user
      return @user
    # else
    #   redirect to error page
    end
  end

end
