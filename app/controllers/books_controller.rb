class BooksController < ApplicationController
  before_action :authenticate_user!
  #before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def new
    @book = Book.new

  end

  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    if @book_new.save
      redirect_to book_path(@book_new.id),notice:'You have created book successfully.'
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def index
    @book_new = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id),notice:'You have updated book successfully.'
    else
      render :edit
    end
  end

  def destroy
    @book =Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

  # def ensure_correct_user(book)
  #   if book.user.id != current_user.id
  #     redirect_to book_path(book.id)
  #   end
  # end


end