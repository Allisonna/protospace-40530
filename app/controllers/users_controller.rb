class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'ユーザーが登録されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = current_user.name
    @prototypes = current_user.prototypes
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile, :occupation, :position)
  end

end
