class AccessController < ApplicationController
  def sign_in_attempt
    login_attempt(params[:email], params[:password])
  end

  def sign_out
  end

  private
  def login_attempt(email, password)
    if email.present? && password.present? 
      user = User.where(email: email).first
      if user
        authorized_user = user.authenticate(password)
        if authorized_user
          session[:user_id] = user.id
          flash[:success] = 'Thanks for logging in!'
          redirect_to user_path(id: user.id)
        else
          redirect_to '/', notice: 'Incorrect email or password'
        end
      else
        redirect_to '/', notice:  'Incorrect email or password'
      end
    else
      redirect_to '/', notice: 'Please enter an email and password'
    end
  end
end
