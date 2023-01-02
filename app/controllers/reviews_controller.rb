class ReviewsController < ApplicationController
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
      user_id: params[:review][:user_id],
      book_id: params[:review][:book_id]
    )
    @review.save
    redirect_to "/"
  end
end
