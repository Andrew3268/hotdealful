class SavingsController < ApplicationController
  before_action :set_saving, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show, :hashtags]

  # GET /savings or /savings.json
  def index
    @savings = Saving.all.order("created_at DESC")
    @latest_savings = Saving.last(1)
    @except_first_savings = Saving.order("id desc").offset(1)
  end

  # GET /savings/1 or /savings/1.json
  def show
  end

  # GET /savings/new
  def new
    # @saving = Saving.new
    @saving = current_user.savings.build
  end

  # GET /savings/1/edit
  def edit
  end

  # POST /savings or /savings.json
  def create
    # @saving = Saving.new(saving_params)
    @saving = current_user.savings.build(saving_params)

    respond_to do |format|
      if @saving.save
        format.html { redirect_to @saving, notice: "Saving was successfully created." }
        format.json { render :show, status: :created, location: @saving }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @saving.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /savings/1 or /savings/1.json
  def update
    respond_to do |format|
      if @saving.update(saving_params)
        format.html { redirect_to @saving, notice: "Saving was successfully updated." }
        format.json { render :show, status: :ok, location: @saving }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @saving.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /savings/1 or /savings/1.json
  def destroy
    @saving.destroy
    respond_to do |format|
      format.html { redirect_to savings_url, notice: "Saving was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saving
      @saving = Saving.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def saving_params
      params.require(:saving).permit(:s_title, :s_link, :s_image, :s_promocode, :s_rating, :s_review_count, :s_is_price, :s_was_price, 
                                     :s_pct, :s_cash_coupon, :s_pct_coupon, :s_description, :s_rating_code)
    end
end

