class HotdealsController < ApplicationController
  before_action :set_hotdeal, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show, :hashtags]

  # GET /hotdeals or /hotdeals.json
  def index
    @pagy, @hotdeals = pagy(Hotdeal.all.order("created_at DESC"), items: 5)
    @hotdeal_top = Hotdeal.most_hit(1.day.ago, 5)
    @coupons_top = Coupon.most_hit(1.day.ago, 5)
    @deals_top = Post.most_hit(1.day.ago, 5)
    @our_pick = Coupon.all.order("created_at DESC")
    @picks = Pick.all.all.order("created_at DESC").limit(1)
    @most_hit = Blogger.most_hit(1.day.ago, 5)
    

    if params[:search]
      @search_term = params[:search]
      @hotdeals = @hotdeals.search_by(@search_term)
    end
  end

  # GET /hotdeals/1 or /hotdeals/1.json
  def show
    @hotdeal.punch(request)
    @coupons_top = Coupon.most_hit(1.day.ago, 5)
    @deals_top = Post.most_hit(1.day.ago, 5)
    @our_pick = Coupon.all.order("created_at DESC")
    @picks = Pick.all.all.order("created_at DESC").limit(1)
    @most_hit = Blogger.most_hit(1.day.ago, 5)
    @hotdeal_top = Hotdeal.most_hit(1.day.ago, 5)

    set_meta_tags revierse: true,
                  description: @hotdeal.deal_description,
                  keywords: 'amazondeals, hotdeals, promotion code, coupons,',
                  twitter: {
                    card: "summary",
                    site: "@thefiive",
                    title: @hotdeal.deal_title,
                    description: @hotdeal.deal_description,
                    image: @hotdeal.deal_image
                  },
                  og: {
                    title: @hotdeal.deal_title,
                    description: @hotdeal.deal_description,
                    type: 'website',
                    url: hotdeal_url(@hotdeal),
                    image: @hotdeal.deal_image
                  }
  end

  def hashtags
    tag = Tag.find_by(name: params[:name])
    @hotdeals = tag.hotdeals.order("created_at DESC")
    @coupons_top = Coupon.most_hit(1.day.ago, 5)
    @deals_top = Post.most_hit(1.day.ago, 5)
    @our_pick = Coupon.all.order("created_at DESC")
    @picks = Pick.all.all.order("created_at DESC").limit(1)
    @most_hit = Blogger.most_hit(1.day.ago, 5)
    @hotdeal_top = Hotdeal.most_hit(1.day.ago, 5)
  end

  # GET /hotdeals/new
  def new
    # @hotdeal = Hotdeal.new
    @hotdeal = current_user.hotdeals.build
  end

  # GET /hotdeals/1/edit
  def edit
  end

  # POST /hotdeals or /hotdeals.json
  def create
    @hotdeal = current_user.hotdeals.build(hotdeal_params)

    respond_to do |format|
      if @hotdeal.save
        format.html { redirect_to @hotdeal, notice: "Hotdeal was successfully created." }
        format.json { render :show, status: :created, location: @hotdeal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hotdeal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotdeals/1 or /hotdeals/1.json
  def update
    respond_to do |format|
      if @hotdeal.update(hotdeal_params)
        format.html { redirect_to @hotdeal, notice: "Hotdeal was successfully updated." }
        format.json { render :show, status: :ok, location: @hotdeal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hotdeal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotdeals/1 or /hotdeals/1.json
  def destroy
    @hotdeal.destroy
    respond_to do |format|
      format.html { redirect_to hotdeals_url, notice: "Hotdeal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotdeal
      @hotdeal = Hotdeal.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hotdeal_params
      params.require(:hotdeal).permit(:deal_title, :deal_link, :deal_image, :deal_source, :deal_hashtag, :deal_rating, :deal_review_count, 
                                      :deal_is_price, :deal_was_price, :deal_pct, :deal_description, :deal_rating_code, :deal_cash_coupon,
                                      :deal_pct_coupon)
    end
end
     

