class OnedaysController < ApplicationController
  before_action :set_oneday, only: %i[ show edit update destroy ]

  # GET /onedays or /onedays.json
  def index
    @onedays = Oneday.all
  end

  # GET /onedays/1 or /onedays/1.json
  def show
  end

  # GET /onedays/new
  def new
    @oneday = Oneday.new
  end

  # GET /onedays/1/edit
  def edit
  end

  # POST /onedays or /onedays.json
  def create
    @oneday = Oneday.new(oneday_params)

    respond_to do |format|
      if @oneday.save
        format.html { redirect_to @oneday, notice: "Oneday was successfully created." }
        format.json { render :show, status: :created, location: @oneday }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @oneday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /onedays/1 or /onedays/1.json
  def update
    respond_to do |format|
      if @oneday.update(oneday_params)
        format.html { redirect_to @oneday, notice: "Oneday was successfully updated." }
        format.json { render :show, status: :ok, location: @oneday }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @oneday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /onedays/1 or /onedays/1.json
  def destroy
    @oneday.destroy
    respond_to do |format|
      format.html { redirect_to onedays_url, notice: "Oneday was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oneday
      @oneday = Oneday.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def oneday_params
      params.require(:oneday).permit(:o_title, :o_image, :o_link, :o_promocode, :o_rating, :o_rating_code, :o_review_count, :o_year,
                                     :o_month, :o_day, :o_is_price, :o_was_price, :o_pct, :o_image, :o_cash_coupon, :o_pct_coupon, :o_description, :o_spare_66)
    end
end
