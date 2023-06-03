class BloggersController < ApplicationController
  before_action :set_blogger, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show, :hashtags]

  # GET /bloggers or /bloggers.json
  def index
    # @pagy, @bloggers = pagy(Blogger.all.order("created_at DESC"), items: 1)
    @bloggers = Blogger.all.order("created_at DESC")
    @latest_blog = Blogger.last(1)
    @pagy, @except_first_blogs = pagy(Blogger.order("id desc").offset(1), items: 10)
    @except_first_blogs = Blogger.order("id desc").offset(1).limit(10)
    
    @picks = Pick.all.all.order("created_at DESC").limit(1)
    @most_hit = Blogger.most_hit(1.day.ago, 5)
    @coupons = Coupon.all.order("created_at DESC").limit(5)
    @hotdeals = Hotdeal.all.order("created_at DESC").limit(5)

    
  end

  # GET /bloggers/1 or /bloggers/1.json
  def show
    @blogger.punch(request)
    @picks = Pick.all.all.order("created_at DESC").limit(1)
    @most_hit = Blogger.most_hit(1.day.ago, 5)
    @coupons = Coupon.all.order("created_at DESC").limit(5)
    @hotdeals = Hotdeal.all.order("created_at DESC").limit(5)

    set_meta_tags title: @blogger.bl_title,
                  site: 'THE FiiVE',
                  revierse: true,
                  description: @blogger.bl_description,
                  keywords: 'amazondeals, hotdeals, promotion code, coupons,',
                  twitter: {
                    card: "summary",
                    site: "@thefiive",
                    title: @blogger.bl_title,
                    description: @blogger.bl_description,
                    image: @blogger.bl_image
                  },
                  og: {
                    title: @blogger.bl_title,
                    description: @blogger.bl_description,
                    type: 'website',
                    url: blogger_url(@blogger),
                    image: @blogger.bl_image
                  }
  end

  def hashtags
    tag = Tag.find_by(name: params[:name])
    @bloggers = tag.bloggers.order("created_at DESC")
    @picks = Pick.all.all.order("created_at DESC").limit(1)
    @most_hit = Blogger.most_hit(1.day.ago, 5)
    @coupons = Coupon.all.order("created_at DESC").limit(5)
    @hotdeals = Hotdeal.all.order("created_at DESC").limit(5)
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
      @blogger = Blogger.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blogger_params
      params.require(:blogger).permit(:bl_title, :bl_content_01, :bl_content_02, :bl_content_03, :bl_content_04, :bl_content_05, :bl_content_06,
                                      :bl_content_07, :bl_subtitle_01, :bl_subtitle_02, :bl_subtitle_03, :bl_subtitle_04, :bl_subtitle_05, :bl_subtitle_06, :bl_subtitle_07,
                                      :bl_image_01, :bl_image_02, :bl_image_03, :bl_image_04, :bl_image_05, :bl_image_06, :bl_image_07, :bl_link_01, :bl_link_02, :bl_link_03,
                                      :bl_link_04, :bl_link_05, :bl_link_06, :bl_link_07, :bl_description, :bl_image, :bl_category, :bl_is_price_01, :bl_is_price_02, :bl_is_price_03, :bl_is_price_04, :bl_is_price_05,
                                      :bl_was_price_01, :bl_was_price_02, :bl_was_price_03, :bl_was_price_04, :bl_was_price_05, :bl_rating_01, :bl_rating_02, :bl_rating_03, :bl_rating_04, :bl_rating_05,
                                      :bl_rating_code_01, :bl_rating_code_02, :bl_rating_code_03, :bl_rating_code_04, :bl_rating_code_05, :bl_review_01, :bl_review_02, :bl_review_03, :bl_review_04, :bl_review_05,
                                      :bl_feat_name_01, :bl_feat_name_02, :bl_feat_name_03, :bl_feat_name_04, :bl_feat_name_05, :bl_feat_name_06, :bl_feat_name_07, :bl_feat_name_08, :bl_feat_name_09, :bl_feat_name_10, :bl_feat_name_11, :bl_feat_name_12, :bl_feat_name_13, :bl_feat_name_14, :bl_feat_name_15, :bl_feat_name_16, :bl_feat_name_17, :bl_feat_name_18, :bl_feat_name_19, :bl_feat_name_20,
                                      :bl_feat_name_21, :bl_feat_name_22, :bl_feat_name_23, :bl_feat_name_24, :bl_feat_name_25, :bl_feat_name_26, :bl_feat_name_27, :bl_feat_name_28, :bl_feat_name_29, :bl_feat_name_30, :bl_feat_name_31, :bl_feat_name_32, :bl_feat_name_33, :bl_feat_name_34, :bl_feat_name_35, :bl_feat_name_36, :bl_feat_name_37, :bl_feat_name_38, :bl_feat_name_39, :bl_feat_name_40,
                                      :bl_feat_num_01, :bl_feat_num_02, :bl_feat_num_03, :bl_feat_num_04, :bl_feat_num_05, :bl_feat_num_06, :bl_feat_num_07, :bl_feat_num_08, :bl_feat_num_09, :bl_feat_num_10, :bl_feat_num_11, :bl_feat_num_12, :bl_feat_num_13, :bl_feat_num_14, :bl_feat_num_15, :bl_feat_num_16, :bl_feat_num_17, :bl_feat_num_18, :bl_feat_num_19, :bl_feat_num_20,
                                      :bl_feat_num_21, :bl_feat_num_22, :bl_feat_num_23, :bl_feat_num_24, :bl_feat_num_25, :bl_feat_num_26, :bl_feat_num_27, :bl_feat_num_28, :bl_feat_num_29, :bl_feat_num_30, :bl_feat_num_31, :bl_feat_num_32, :bl_feat_num_33, :bl_feat_num_34, :bl_feat_num_35, :bl_feat_num_36, :bl_feat_num_37, :bl_feat_num_38, :bl_feat_num_39, :bl_feat_num_40,)
    end
end



    
    
