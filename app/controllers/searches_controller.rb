class SearchesController < ApplicationController
 before_action :authenticate_user!

  def search
    @range = params[:range]
    @word = params[:word]
    @search = params[:serch]
    @book = Book.all

    if @range == "user"
      @users = User.looks(params[:search], params[:word])
    else
      @books = Book.looks(params[:search], params[:word])
    end
  end
end