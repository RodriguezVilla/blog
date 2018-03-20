class PostsController < ApplicationController
  include CurrentPublicidad
  include CurrentUser
  include CurrentComment

  before_action :mostrar_publicidad, only: [:index]
  before_action :view_comments, only: [:show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  skip_before_action :no_autoriza, only: [:index, :show]

  def comprobar_user
    @usu =  lambda {usu?}
    @total = lambda {usu_total?}
    @blog = lambda {usu_blog?}
    @publi = lambda {usu_publi?}
  end


  # GET /posts
  # GET /posts.json
  def index
    view_comments

    @posts = Post.order(fecha: :desc)
    comprobar_user

  end
  # GET /posts/1
  # GET /posts/1.json
  def show
    comprobar_user


  end

  # GET /posts/new
  def new
    comprobar_user
    (usu_total? || usu_blog?) ? @post = Post.new : (redirect_to login_url, notice: "Sin privilegios de blog")
  end

  # GET /posts/1/edit
  def edit
    comprobar_user
    if (usu_total? || usu_blog?)
    else
      (redirect_to login_url, notice: "Sin privilegios de blog")
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    comprobar_user
    if (usu_total? || usu_blog?)
      @post = Post.new(post_params)

      respond_to do |format|
        if @post.save
          format.html { redirect_to @post, notice: 'Post was successfully created.' }
          format.json { render :show, status: :created, location: @post }
        else
          format.html { render :new }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    else
      (redirect_to login_url, notice: "Sin privilegios de blog")
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    comprobar_user
    if (usu_total? || usu_blog?)
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to @post, notice: 'Post was successfully updated.' }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    else
      (redirect_to login_url, notice: "Sin privilegios de blog")
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    comprobar_user
    if (usu_total? || usu_blog?)
      @post.destroy
      respond_to do |format|
        format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      (redirect_to login_url, notice: "Sin privilegios de blog")
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:titulo, :descripticion, :img_destacada_url, :fecha)
    end
end
