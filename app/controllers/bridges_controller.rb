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

  def share_facebook
    # @posts = Post.all.order('RANDOM()').limit(20) 
    @posts = Post.all.order("created_at DESC").limit(25)
  end

  def share_ko
    @posts = Post.all.order("created_at DESC").limit(50)
  end

  def new_index
    # @pagy, @posts = pagy(Post.all.order("created_at DESC"), items:40)
    @coupons = Coupon.most_hit(1.day.ago, 10)
    @online_deals = Coupon.most_hit(1.day.ago, 10)
    # @coupons = Coupon.sort_by_popularity('DESC')
  end

  def new_under_deal
    @pagy, @posts = pagy(Post.all.order("created_at DESC"), items: 40)
  end

  def new_half_deal
    @pagy, @posts = pagy(Post.all.order("created_at DESC"), items: 40)
  end

  def delete_coupons
    @coupons = Coupon.all.order("created_at DESC")
  end

  def delete_hotdeals
    @coupons = Coupon.all.order("created_at DESC")
  end

end
