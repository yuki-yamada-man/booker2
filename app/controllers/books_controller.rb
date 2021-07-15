class BooksController < ApplicationController
  def new
    @book = Book.new
    
  end

  def create
    @book = Book.new(book_params)
    book.save
    redirect_to book_path
  end

  def index
    @book = Book.all
  end

  def show
    @book = Book.find(params[id])
  end

  def edit
    @book = Book.find(params[id])
  end

  def update
    @book = Book.find(params[id])
    book.update
    redirect_to book_path
  end

  def destroy
    @book =Book.find(params[id])
    book.destroy
    redirect_to book_path
  end
  
  
  preivate
  
  def book_params
    params.require(:book).permit(:title,:body)
    e
    

end