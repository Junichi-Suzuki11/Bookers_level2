class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:welcome]

  def welcome
  end

  def index
  	@book = Book.new
  	@books = Book.all
  end

  def create
  	@book = Book.new(book_params)	#ストロングパラメータを使用
  	@book.user_id = current_user.id
    @books = Book.all
    if @book.save #  dbへ保存
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id) # 詳細画面へリダイレクト
    else
      render :index
    end
  end

  def show
  	@book = Book.find(params[:id])
    @new_book = Book.new

  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
    if @book.update(book_params)	#更新をdbへ反映
  	  flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)	#詳細画面へリダイレクト
    else
      render :edit
    end
  end

  def destroy
  	book = Book.find(params[:id])	#レコードを１件取得
    book.destroy	#レコードをdbから削除
  	redirect_to books_path	#トップページへリダイレクト
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
