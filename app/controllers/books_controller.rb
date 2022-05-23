class BooksController < ApplicationController

  def index
    @user = current_user
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
    @user = current_user
    @book = Book.new
    @book = Book.find(params[:id])
  end
 
  def destroy
   book = Book.find(params[:id]) 
   book.destroy
   redirect_to '/books'
  end
  private

  def book_params
    params.permit(:title, :body)
  end

end
