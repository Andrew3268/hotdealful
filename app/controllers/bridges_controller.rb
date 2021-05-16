class BridgesController < ApplicationController

  def finder_detail
  end

  def delete_old_post
    @posts = Post.all
  end

end
