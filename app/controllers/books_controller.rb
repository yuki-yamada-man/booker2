class BooksController < ApplicationController
  def new
    @book = Book.new
    
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id),notice:'Book was successfuly created'
    else
      render :new
    end
  end

  def index
    @book = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render edit_book_path
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update
      redirect_to book_path(book.id),notice:'Book was successfuly updated'
    else
      render :edit_book_path
    end
  end

  def destroy
    @book =Book.find(params[:id])
    book.destroy
    redirect_to book_path
  end
  
  
  preivate
  
  def book_params
    params.require(:book).permit(:title,:body)
  end
    

end