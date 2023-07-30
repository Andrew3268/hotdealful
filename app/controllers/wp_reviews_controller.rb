class WpReviewsController < ApplicationController
  before_action :set_wp_review, only: %i[ show edit update destroy ]

  # GET /wp_reviews or /wp_reviews.json
  def index
    @wp_reviews = WpReview.all
  end

  # GET /wp_reviews/1 or /wp_reviews/1.json
  def show
  end

  # GET /wp_reviews/new
  def new
    @wp_review = WpReview.new
  end

  # GET /wp_reviews/1/edit
  def edit
  end

  # POST /wp_reviews or /wp_reviews.json
  def create
    @wp_review = WpReview.new(wp_review_params)

    respond_to do |format|
      if @wp_review.save
        format.html { redirect_to @wp_review, notice: "Wp review was successfully created." }
        format.json { render :show, status: :created, location: @wp_review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wp_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wp_reviews/1 or /wp_reviews/1.json
  def update
    respond_to do |format|
      if @wp_review.update(wp_review_params)
        format.html { redirect_to @wp_review, notice: "Wp review was successfully updated." }
        format.json { render :show, status: :ok, location: @wp_review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wp_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wp_reviews/1 or /wp_reviews/1.json
  def destroy
    @wp_review.destroy
    respond_to do |format|
      format.html { redirect_to wp_reviews_url, notice: "Wp review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wp_review
      @wp_review = WpReview.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wp_review_params
      params.require(:wp_review).permit(:title, :content)
    end
end
