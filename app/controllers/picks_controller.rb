class PicksController < ApplicationController
  before_action :set_pick, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show, :hashtags]

  # GET /picks or /picks.json
  def index
    @picks = Pick.all.all.order("created_at DESC")
    @latest_picks = Pick.last(1)
    @except_first_picks = Pick.order("id desc").offset(1)
  end

  # GET /picks/1 or /picks/1.json
  def show
    # set_meta_tags title: @pick.p_title,
    #               site: 'THE FiiVE',
    #               revierse: true,
    #               description: @pick.p_spare_01,
    #               keywords: 'amazondeals, hotdeals, promotion code, coupons,',
    #               twitter: {
    #                 card: "summary",
    #                 site: "@thefiive",
    #                 title: @pick.p_title,
    #                 description: @pick.p_spare_01,
    #                 image: @pick.p_image,
    #               },
    #               og: {
    #                 title: @pick.p_title,
    #                 description: @pick.p_spare_01,
    #                 type: 'website',
    #                 url: pick_url(@pick),
    #                 image: @pick.p_image,
    #               }
  end

  def hashtags
    tag = Tag.find_by(name: params[:name])
    @picks = tag.picks
  end

  # GET /picks/new
  def new
    @pick = current_user.picks.build
  end

  # GET /picks/1/edit
  def edit
  end

  # POST /picks or /picks.json
  def create
    @pick = current_user.picks.build(pick_params)

    respond_to do |format|
      if @pick.save
        format.html { redirect_to @pick, notice: "Pick was successfully created." }
        format.json { render :show, status: :created, location: @pick }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pick.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /picks/1 or /picks/1.json
  def update
    respond_to do |format|
      if @pick.update(pick_params)
        format.html { redirect_to @pick, notice: "Pick was successfully updated." }
        format.json { render :show, status: :ok, location: @pick }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pick.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /picks/1 or /picks/1.json
  def destroy
    @pick.destroy
    respond_to do |format|
      format.html { redirect_to picks_url, notice: "Pick was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pick
      @pick = Pick.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pick_params
      params.require(:pick).permit(:p_title, :p_image, :p_link, :p_hashtag, :p_spare_01)
    end
end

