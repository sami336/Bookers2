class BooksController < ApplicationController

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id), notice: "You have created book successfully."
  end

  def show
    @user = current_user
    @new_book = Book.new
    @book = Book.find(params[:id])
  end

  def destroy
   book = Book.find(params[:id])
   book.destroy
   redirect_to '/books'
  end

  def edit
   @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id), notice: "You have updated book successfully."
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
