class Api::V1::BookGenresController < ApplicationController
  before_action :set_book_genre, only: [:show, :update, :destroy]

  # GET /book_genres
  def index
    @book_genres = BookGenre.all

    render json: @book_genres
  end

  # GET /book_genres/1
  def show
    render json: @book_genre
  end

  # POST /book_genres
  def create
    @book_genre = BookGenre.new(book_genre_params)

    if @book_genre.save
      render json: @book_genre, status: :created, location: @book_genre
    else
      render json: @book_genre.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /book_genres/1
  def update
    if @book_genre.update(book_genre_params)
      render json: @book_genre
    else
      render json: @book_genre.errors, status: :unprocessable_entity
    end
  end

  # DELETE /book_genres/1
  def destroy
    @book_genre.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_genre
      @book_genre = BookGenre.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_genre_params
      params.require(:book_genre).permit(:genre_id, :book_id)
    end
end
