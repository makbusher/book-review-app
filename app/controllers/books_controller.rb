class BooksController < ApplicationController
  def index
    @books = Book.all 
    render template: "books/index"
  end

  def show 
    @book = Book.find_by(id: params[:id])
    render template: "books/show"
  end
end
