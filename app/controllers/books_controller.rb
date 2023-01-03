class BooksController < ApplicationController
  before_action :authenticate_user

  def index
    @books = Book.all 
    render template: "books/index"
  end

  def show 
    @book = Book.find_by(id: params[:id])
    render template: "books/show"
  end

  def new 
    @book = Book.new
    render template: "books/new"
  end

  def create
    @book = Book.new(
      title: params[:book][:title],
      author: params[:book][:author],
      summary: params[:book][:summary],
      image_url: params[:book][:image_url],
      genre: params[:book][:genre],
      user_id: @current_user.id
    )
    @book.save
    redirect_to "/books"
  end
end
