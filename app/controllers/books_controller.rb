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
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @new_book = Book.new
  end

  def destroy
   book = Book.find(params[:id])
   book.destroy
   redirect_to books_path
  end

  def edit
   @book = Book.find(params[:id])
    if @book.user == current_user
      render :edit
    else
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render :index
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
