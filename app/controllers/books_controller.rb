class BooksController < ApplicationController
  #before_action :find_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  #before_action :authenticate_user!


  # def search
 
  # end

  def index
    @books = Book.all.order("created_at DESC") 
  end

  
  def show
    @book = Book.find(params[:id])
    @reviews =@book.reviews 


    # @review = Review.where(book_id: @book.id).order("created_at DESC")

    # if @reviews.blank?
    #   @avg_review = 0
    # else
    #   @avg_review = @review.average(:rating).round(2)
    # end
  end
  def new
    @book=Book.new
    @categories = Category.all.map{ |c| [c.name, c.id]}
  end
  def create
    @book = Book.new(book_params) 
    @book.user_id = current_user.id
    @book.category_id =params[:category_id]
    @book.save
    redirect_to @book
    # render 'new'
  end

  def edit
    @book = Book.find(params[:id])
    @categories = Category.all.map{ |c| [c.name, c.id]}
  end

  def update
    #@book.category_id =params[:category_id]
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book
  end

  def destroy
    Book.find(params[:id]).destroy
    redirect_to books_path, :notice=>"your book has been deleted"
  end

  private

  def book_params
    params.require(:book).permit(:book_name, :description, :author_name,:poster,:rating, :category_id)
  end
end