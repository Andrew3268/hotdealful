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

end
