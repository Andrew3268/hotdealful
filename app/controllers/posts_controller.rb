class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show, :hashtags]

  # GET /posts or /posts.json
  def index
    @pagy, @posts = pagy(Post.all.order("created_at DESC"), items: 40)
    if params[:search]
      @search_term = params[:search]
      @posts = @posts.search_by(@search_term)
    end
  end

  # GET /posts/1 or /posts/1.json
  def show
    @post.punch(request)
    set_meta_tags title: @post.title,
                  site: 'hotdeal-ful',
                  revierse: true,
                  description: @post.title,
                  keywords: 'amazondeals, hotdeals, promotion code, coupons ',
                  twitter: {
                    card: "summary",
                    site: "@hotdealful",
                    title: @post.title,
                    description: @post.title,
                    image: @post.image
                  },
                  og: {
                    title: @post.title,
                    description: @post.title,
                    type: 'website',
                    url: post_url(@post),
                    image: @post.image
                  }
  end

  def hashtags
    tag = Tag.find_by(name: params[:name])
    @pagy, @posts = pagy(tag.posts.order("created_at DESC"), items: 40)  
  end

  # GET /posts/new
  def new
    @post = current_user.posts.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to "/bridges/delete_old_post", notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :link, :image, :source, :hashtag, :rating, :review_count, :is_price, :was_price,
                                   :pct, :description, :promocode, :spare_41, :spare_42, :spare_43, :spare_01)
    end
end

