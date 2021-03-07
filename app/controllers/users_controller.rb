class UsersController < ApplicationController
  skip_before_action :verified_user, only: %i[new create]

  def index
    @users = User.all
  end

  def show
    set_user
  end

  def new
    @user = User.new
  end

  def create
    if (user = User.create(user_params))
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render 'new'
    end
  end

  private

  def set_user
    @user = User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name,
      :password,
      :happiness,
      :tickets,
      :height,
      :nausea,
      :admin
    )
  end
end
