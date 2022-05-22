class BooksController < ApplicationController

  def index
    @user = current_user
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to controller: :book, action: :show
  end
  
  def show
  end
  
  private

  def book_params
    params.permit(:title, :body)
  end

end
