class BridgesController < ApplicationController

  def finder_detail
    @latest_blog = Blogger.last(1)
    @picks = Pick.all.all.order("created_at DESC").limit(1)
    @most_hit = Blogger.most_hit(1.day.ago, 5)
    @coupons = Coupon.all.order("created_at DESC").limit(5)
    @hotdeals = Hotdeal.all.order("created_at DESC").limit(5)
  end

  def delete_old_post
    @posts = Post.all
  end

  def delete_coupons
    @coupons = Coupon.all.order("created_at DESC")
  end

  def delete_hotdeals
    @posts = Post.all.order("created_at DESC")
  end

  # def home
  #   @homes = Home.all.order("created_at DESC")
  #   @coupons = Coupon.all.order("created_at DESC").limit(10)
  #   @extra_deals = Post.all.order("created_at DESC").limit(10)
  #   @coupons_top = Coupon.most_hit(3.day.ago, 5)
  #   @deals_top = Post.most_hit(3.day.ago, 10)
  # end

  # def coupon_section
  #   @pagy, @coupons = pagy(Coupon.all.order("created_at DESC"), items: 40)
  #   @coupons_top = Coupon.most_hit(100.day.ago, 10) 
  # end

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
    @bloggers = Blogger.all.order("created_at DESC").limit(5)
    @hotdeals = Hotdeal.all.order("created_at DESC").limit(2)


    
  end

  # def deal_section
  #   @pagy, @extra_deals = pagy(Post.all.order("created_at DESC"), items: 40)
  #   @deals_top = Post.most_hit(3.day.ago, 10)
  #   @coupons_top = Coupon.most_hit(100.day.ago, 10) 
  # end

  # def onedays
  #   @onedays = Oneday.all.order("created_at DESC")
  # end

  # def promo_codes
  #   @pagy, @coupons = pagy(Coupon.all.order("created_at DESC"), items: 100)
  # end

  def trending_coupon
    @coupons_top = Coupon.most_hit(2.day.ago, 50)
  end

  def reviews
    @bloggers = Blogger.all.order("created_at DESC")
    @latest_blog = Blogger.last(1)
    @pagy, @except_first_blogs = pagy(Blogger.order("id desc").offset(1), items: 10)
    @picks = Pick.all.all.order("created_at DESC").limit(1)
    @most_hit = Blogger.most_hit(1.day.ago, 5)
    @coupons = Coupon.all.order("created_at DESC").limit(5)
    @hotdeals = Hotdeal.all.order("created_at DESC").limit(5)

    if params[:search]
      @search_term = params[:search]
      @bloggers = @bloggers.search_by(@search_term)
    end
  end


end
