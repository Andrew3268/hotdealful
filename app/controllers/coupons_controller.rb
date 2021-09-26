class CouponsController < ApplicationController
  before_action :set_coupon, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show, :hashtags]

  # GET /coupons or /coupons.json
  def index
    @pagy, @coupons = pagy(Coupon.all.order("created_at DESC"), items: 40)
    if params[:search]
      @search_term = params[:search]
      @coupons = @coupons.search_by(@search_term)
    end
  end

  # GET /coupons/1 or /coupons/1.json
  def show
  end

  def hashtags
    tag = Tag.find_by(name: params[:name])
    @coupons = tag.coupons.order("created_at DESC")
  end

  # GET /coupons/new
  def new
    @coupon = current_user.coupons.build
  end

  # GET /coupons/1/edit
  def edit
  end

  # POST /coupons or /coupons.json
  def create
    @coupon = current_user.coupons.build(coupon_params)

    respond_to do |format|
      if @coupon.save
        format.html { redirect_to "/homes", notice: "Coupon was successfully created." }
        format.json { render :show, status: :created, location: @coupon }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coupons/1 or /coupons/1.json
  def update
    respond_to do |format|
      if @coupon.update(coupon_params)
        format.html { redirect_to @coupon, notice: "Coupon was successfully updated." }
        format.json { render :show, status: :ok, location: @coupon }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupons/1 or /coupons/1.json
  def destroy
    @coupon.destroy
    respond_to do |format|
      format.html { redirect_to coupons_url, notice: "Coupon was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupon
      @coupon = Coupon.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coupon_params
      params.require(:coupon).permit(:c_title, :c_link, :c_image, :c_source, :c_hashtag, :c_promocode, :c_rating, :c_review_count, 
                                     :c_is_price, :c_was_price, :c_pct, :c_description, :c_spare_56)
    end
  
end
