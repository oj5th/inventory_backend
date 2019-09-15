class Api::V1::BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]

  # GET /books
  def index
    @books = params[:field] ? Book.find_by_field(params[:field], params[:value]) : Book.all
    render json: generate_json
  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_authors_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
  end

  def delete_books
    @books = Book.where(id: params[:ids].split(",")).destroy_all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.require(:book).permit(:isbn, :title, :date_published)
    end

    def book_authors_params
      params.require(:book).permit(:isbn, :title, :date_published, authors_attributes: [:id, :firstname, :middlename, :lastname])
    end

    def generate_json
      book_json = []
      @books.each do |book|
        book_json << {
          id: book.id,
          isbn: book.isbn,
          title: book.title,
          date_published: book.date_published,
          authors: book.authors.names,
          genres: book.genres.names
        }
      end
      book_json
    end
end
