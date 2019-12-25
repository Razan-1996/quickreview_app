class ReviewsController < ApplicationController
# before_action :set_review, only: [:show, :destroy]
 skip_before_action :verify_authenticity_token
 before_action :authenticate_user!

  def index
    @reviews = Review.all
  end


  def show
    @book = Book.find(params[:book_id])
    @reviews =@book.reviews  
  end

  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def edit
    puts "edit review"
    @book = Book.find(params[:book_id])
    @review= Review.find(params[:id])
    
  end
  
  def create
    puts params
    # @review = Review.create(review_params)
 #    @review.book_id = params[:book_id]
    
    book = Book.find(params[:book_id])
    @review=Review.new(review_params)
    @review.user_id = current_user.id
    @review.save


 		redirect_to book
    
  end
  
  
  def update
    @review = Review.find(params[:book_id])
    puts "review id"
    puts @review.id
    @review.update(review_params)
    book = Book.find(params[:review][:book_id])
    @review.update(params.require(:review).permit(:rating, :comment))
    redirect_to book
  end

  def destroy
    @book = Book.find(params[:book_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to book_path(@book)
    # redirect_to root_path
  end

  
   
private
def set_review
  @review = Review.find(params[:id])
end

def set_book
  @review = Book.find(params[:review_id])
end

    def review_params
      params.require(:review).permit(:id, :comment,:rating,:book_id, :user_id)
    end
end

