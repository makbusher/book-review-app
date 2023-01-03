class ReviewsController < ApplicationController
  before_action :authenticate_user
  before_action :find_book, only: [:create]
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
    @review = Review.new(
    rating: params[:review][:rating],
    description: params[:review][:description],
    book_id: @book.id,
    user_id: @current_user.id
    )

    @review.save
    redirect_to "/"
  end

  private
    def review_params
      params.permit(:rating, :description, :book_id)
    end

    def find_book
      @book = Book.find_by(id: params[:book_id])
    end
end
