class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show edit update destroy ]
  before_action :find_movie, only: %i[create]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @movie = Movie.find_by(id: params[:movie_id])
    @current_user = current_user
    @review = Review.new
  end

  def edit
  end

  def create
    @review = @movie.reviews.new(review_params)
    if @review.save
      redirect_to @movie, notice: 'Review successfully created.'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to review_url(@review), notice: "Review was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy!

    respond_to do |format|
      format.html { redirect_to reviews_url, notice: "Review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def find_movie
      @movie = Movie.find(params[:movie_id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:stars, :review, :user_id)
    end
end
