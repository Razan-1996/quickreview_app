class ReviewsController < ApplicationController
# before_action :set_review, only: [:show, :destroy]
 
 before_action :authenticate_user!

  def index
    @reviews = Review.all
  end
  def new
    
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def edit
    @review = Review.find(params[:id])
  end
  
  def create
    puts params
    # @review = Review.create(review_params)
 #    @review.book_id = params[:book_id]
    
    book = Book.find(params[:review][:book_id])
    Review.create(review_params)
 		redirect_to book
    
  end
  
  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
  end

  def destroy
    @review.destroy
    redirect_to root_path
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def set_book
      @review = Book.find(params[:review_id])
    end
private
    def review_params
      params.require(:review).permit(:book_id,:user_id, :comment,:rating)
    end
end

