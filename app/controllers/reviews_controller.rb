class ReviewsController < ApplicationController
  before_action :authenticate_user
  def index 
    @reviews = Review.all 
    render template: "reviews/index"
  end

  def show
    @review = Review.find_by(id: params[:id])
    render template: "reviews/show"
  end

  def new 
    @review = Review.new 
    render template: "reviews/new"
  end

  def create
    @review = Review.new(review_params)
    @review.book_id = @book.id
    @review.user_id = @current_user.id
    
    @review.save
    redirect_to "/"
  end

  private
    def review_params
      params.permit(:rating, :description)
    end

    def find_book
      @book = Book.find_by(params[:id])
    end
end
