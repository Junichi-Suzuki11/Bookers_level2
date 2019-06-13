class BooksController < ApplicationController
  def show
  end

  def index
  	@book = Book.new
  	@books = Book.all
  end

  def new
  	@book = Book.new
  end

  def create
  	book = Book.new(post_params)
  	book.save
  	redirect_to books_path
  end

  def edit
  end

  private
  def post_params
  	params.require(:post).permit(:title, :body)
  end
end
