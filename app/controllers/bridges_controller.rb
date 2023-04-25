class BridgesController < ApplicationController

  def finder_detail
  end

  def delete_old_post
    @posts = Post.all
  end

  def under_deal
    @pagy, @posts = pagy(Post.all.order("created_at DESC"), items: 30)
  end

  def half_deal
    @pagy, @posts = pagy(Post.all.order("created_at DESC"), items: 30)
  end

  def share_fb
    # @posts = Post.all.order('RANDOM()').limit(20) 
    # @posts = Post.all.order("created_at DESC").limit(25)
    @coupons = Coupon.all.order("created_at DESC")
  end

  def share_ko
    # @posts = Post.all.order("created_at DESC").limit(50)
    @coupons = Coupon.all.order("created_at DESC")
  end

  def share_ko_people
    @coupons = Coupon.all.order("created_at DESC").limit(400)
  end

  # def new_index
  #   # @pagy, @posts = pagy(Post.all.order("created_at DESC"), items:40)
  #   @coupons = Coupon.most_hit(1.day.ago, 10)
  #   @online_deals = Coupon.most_hit(1.day.ago, 10)
  #   # @coupons = Coupon.sort_by_popularity('DESC')
  # end

  def delete_coupons
    @coupons = Coupon.all.order("created_at DESC")
  end

  def delete_hotdeals
    @posts = Post.all.order("created_at DESC")
  end

  def admin_panel
    @coupons = Coupon.all.order("created_at DESC")
  end

  def home
    @homes = Home.all.order("created_at DESC")
    @coupons = Coupon.all.order("created_at DESC").limit(10)
    @extra_deals = Post.all.order("created_at DESC").limit(10)
    @coupons_top = Coupon.most_hit(3.day.ago, 5)
    @deals_top = Post.most_hit(3.day.ago, 10)
  end

  def coupon_section
    @pagy, @coupons = pagy(Coupon.all.order("created_at DESC"), items: 40)
    @coupons_top = Coupon.most_hit(100.day.ago, 10) 
  end

  def landing_page
    @pagy, @coupons = pagy(Coupon.all.order("created_at DESC"), items: 20)
    @coupons_top = Coupon.most_hit(100.day.ago, 5) 
    @latest_picks = Pick.last(1)
    @except_first_picks = Pick.order("id desc").offset(1).limit(3)
    @our_pick = Coupon.all.order("created_at DESC")
    @by_rating = Coupon.all.order("created_at DESC").limit(5)
    @by_review = Coupon.all.order("created_at DESC").limit(5)
    @under_ten = Coupon.all.order("created_at DESC").limit(5)
    @onedays = Oneday.all.order("created_at DESC")
    @latest_coupons = Coupon.last(5)
    @except_first_coupons = Coupon.order("id desc").offset(1).limit(15)
    @clippings = Clipping.all.order("created_at DESC").limit(4)
    @blogs = Blog.all.order("created_at DESC").limit(5)


    
  end

  def deal_section
    @pagy, @extra_deals = pagy(Post.all.order("created_at DESC"), items: 40)
    @deals_top = Post.most_hit(3.day.ago, 10)
    @coupons_top = Coupon.most_hit(100.day.ago, 10) 
  end

  def onedays
    @onedays = Oneday.all.order("created_at DESC")
  end

  def promo_codes
    @pagy, @coupons = pagy(Coupon.all.order("created_at DESC"), items: 100)
  end

  def trending_coupon
    @coupons_top = Coupon.most_hit(2.day.ago, 50)
  end


end
