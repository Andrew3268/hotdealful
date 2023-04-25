class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /blogs or /blogs.json
  def index
    @blogs = Blog.all.order("created_at DESC")
  end

  # GET /blogs/1 or /blogs/1.json
  def show
  end

  # GET /blogs/new
  def new
    @blog = current_user.blogs.build
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs or /blogs.json
  def create
    @blog = current_user.blogs.build(blog_params)
  
    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: "Blog was successfully created." }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: "Blog was successfully updated." }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "Blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:blog_m_title, :blog_content_01, :blog_content_02, :blog_content_03, :blog_content_04, :blog_content_05, :blog_content_06,
                                   :blog_content_07, :blog_subtitle_01, :blog_subtitle_02, :blog_subtitle_03, :blog_subtitle_04, :blog_subtitle_05, :blog_subtitle_06, :blog_subtitle_07,
                                   :blog_image_01, :blog_image_02, :blog_image_03, :blog_image_04, :blog_image_05, :blog_image_06, :blog_image_07, :blog_link_01, :blog_link_02, :blog_link_03,
                                   :blog_link_04, :blog_link_05, :blog_link_06, :blog_link_07, :blog_m_description, :blog_m_image, :blog_m_category)
    end
end
