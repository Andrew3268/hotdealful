class BloggersController < ApplicationController
  before_action :set_blogger, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show, :hashtags]

  # GET /bloggers or /bloggers.json
  def index
    @pagy, @bloggers = pagy(Blogger.all.order("created_at DESC"), items: 20)
  end

  # GET /bloggers/1 or /bloggers/1.json
  def show
  end

  # GET /bloggers/new
  def new
    # @blogger = Blogger.new
    @blogger = current_user.bloggers.build
  end

  # GET /bloggers/1/edit
  def edit
  end

  # POST /bloggers or /bloggers.json
  def create
    @blogger = current_user.bloggers.build(blogger_params)

    respond_to do |format|
      if @blogger.save
        format.html { redirect_to @blogger, notice: "Blogger was successfully created." }
        format.json { render :show, status: :created, location: @blogger }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blogger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bloggers/1 or /bloggers/1.json
  def update
    respond_to do |format|
      if @blogger.update(blogger_params)
        format.html { redirect_to @blogger, notice: "Blogger was successfully updated." }
        format.json { render :show, status: :ok, location: @blogger }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blogger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bloggers/1 or /bloggers/1.json
  def destroy
    @blogger.destroy
    respond_to do |format|
      format.html { redirect_to bloggers_url, notice: "Blogger was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blogger
      @blogger = Blogger.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blogger_params
      params.require(:blogger).permit(:bl_title, :bl_content_01, :bl_content_02, :bl_content_03, :bl_content_04, :bl_content_05, :bl_content_06,
                                      :bl_content_07, :bl_subtitle_01, :bl_subtitle_02, :bl_subtitle_03, :bl_subtitle_04, :bl_subtitle_05, :bl_subtitle_06, :bl_subtitle_07,
                                      :bl_image_01, :bl_image_02, :bl_image_03, :bl_image_04, :bl_image_05, :bl_image_06, :bl_image_07, :bl_link_01, :bl_link_02, :bl_link_03,
                                      :bl_link_04, :bl_link_05, :bl_link_06, :bl_link_07, :bl_description, :bl_image, :bl_category, :bl_is_price_01, :bl_is_price_02, :bl_is_price_03, :bl_is_price_04, :bl_is_price_05,
                                      :bl_was_price_01, :bl_was_price_02, :bl_was_price_03, :bl_was_price_04, :bl_was_price_05, :bl_rating_01, :bl_rating_02, :bl_rating_03, :bl_rating_04, :bl_rating_05,
                                      :bl_rating_code_01, :bl_rating_code_02, :bl_rating_code_03, :bl_rating_code_04, :bl_rating_code_05, :bl_review_01, :bl_review_02, :bl_review_03, :bl_review_04, :bl_review_05)
    end
end



    
    
