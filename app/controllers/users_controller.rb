class UsersController < ApplicationController
  
  
  def new
    @user = User.new
  end
  
  def show
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path
  end
 
  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :image, :introduction)  
  end
end
