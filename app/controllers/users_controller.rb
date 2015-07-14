class UsersController < ApplicationController
  def new

  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Account created successfully'
    else
      redirect_to signup_path
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password_digest)
  end
end
