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
