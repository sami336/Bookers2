class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
       redirect_to user_path(current_user), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
