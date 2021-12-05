class HomesController < ApplicationController
  before_action :set_home, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /homes or /homes.json
  def index
    @homes = Home.all.order("created_at DESC")
    @coupons = Coupon.all.order("created_at DESC").limit(40)
    @coupons_top = Coupon.most_hit(5.day.ago, 10)
    @deals_top = Coupon.most_hit(7.day.ago, 10)
  end

  # GET /homes/1 or /homes/1.json
  def show
  end

  # GET /homes/new
  def new
    @home = current_user.homes.build
  end

  # GET /homes/1/edit
  def edit
  end

  # POST /homes or /homes.json
  def create
    @home = current_user.homes.build(home_params)

    respond_to do |format|
      if @home.save
        format.html { redirect_to "/homes", notice: "Home was successfully created." }
        format.json { render :show, status: :created, location: @home }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homes/1 or /homes/1.json
  def update
    respond_to do |format|
      if @home.update(home_params)
        format.html { redirect_to "/homes", notice: "Home was successfully updated." }
        format.json { render :show, status: :ok, location: @home }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homes/1 or /homes/1.json
  def destroy
    @home.destroy
    respond_to do |format|
      format.html { redirect_to homes_url, notice: "Home was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home
      @home = Home.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def home_params
      params.require(:home).permit(:main_title, :main_image, :main_link, :main_description, :sub_title_01, :sub_title_02, :sub_title_03,
                                   :sub_title_04, :sub_title_05, :sub_image_01, :sub_image_02, :sub_image_03, :sub_image_04, :sub_image_05,
                                   :sub_link_01, :sub_link_02, :sub_link_03, :sub_link_04, :sub_link_05, :sub_is_price_01, :sub_is_price_02,
                                   :sub_is_price_03, :sub_is_price_04, :sub_is_price_05, :sub_was_price_01, :sub_was_price_02, :sub_was_price_03,
                                   :sub_was_price_04, :sub_was_price_05, :sub_pct_01, :sub_pct_02, :sub_pct_03, :sub_pct_04, :sub_pct_05)
    end
end


