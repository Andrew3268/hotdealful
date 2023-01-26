class ClippingsController < ApplicationController
  before_action :set_clipping, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /clippings or /clippings.json
  def index
    @clippings = Clipping.all.order("created_at DESC")
  end

  # GET /clippings/1 or /clippings/1.json
  def show
  end

  # GET /clippings/new
  def new
    @clipping = current_user.clippings.build
  end

  # GET /clippings/1/edit
  def edit
  end

  # POST /clippings or /clippings.json
  def create
    @clipping = current_user.clippings.build(clipping_params)

    respond_to do |format|
      if @clipping.save
        format.html { redirect_to @clipping, notice: "Clipping was successfully created." }
        format.json { render :show, status: :created, location: @clipping }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @clipping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clippings/1 or /clippings/1.json
  def update
    respond_to do |format|
      if @clipping.update(clipping_params)
        format.html { redirect_to @clipping, notice: "Clipping was successfully updated." }
        format.json { render :show, status: :ok, location: @clipping }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @clipping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clippings/1 or /clippings/1.json
  def destroy
    @clipping.destroy
    respond_to do |format|
      format.html { redirect_to clippings_url, notice: "Clipping was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clipping
      @clipping = Clipping.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def clipping_params
      params.require(:clipping).permit(:cli_title, :cli_img, :cli_link, :cli_sub_title, :cli_pct, :cli_categories, :cli_spare_61)
    end
end
