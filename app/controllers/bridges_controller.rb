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

  # def new_index
  #   # @pagy, @posts = pagy(Post.all.order("created_at DESC"), items:40)
  #   @coupons = Coupon.most_hit(1.day.ago, 10)
  #   @online_deals = Coupon.most_hit(1.day.ago, 10)
  #   # @coupons = Coupon.sort_by_popularity('DESC')
  # end

  def delete_coupons
    @coupons = Coupon.all
  end

  def delete_hotdeals
    @posts = Post.all
  end

  def delete_shoes
    @deals = Deal.all
  end

  def random_deals
    @deals = Deal.offset(rand(Deal.count)).limit(1)
  end

  def admin_panel
    @coupons = Coupon.all.order("created_at DESC")
  end

end
