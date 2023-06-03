class SitemapController < ApplicationController
  respond_to :xml
  def index
    @posts = Post.all.order("created_at DESC")
    @coupons = Coupon.all.order("created_at DESC")
    @bloggers = Blogger.all.order("created_at DESC")
    @hotdeals = Hotdeal.all.order("created_at DESC")
    @picks = Pick.all.order("created_at DESC")
  end
end
