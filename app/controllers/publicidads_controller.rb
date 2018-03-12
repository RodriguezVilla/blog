class PublicidadsController < ApplicationController
  include CurrentUser
  before_action :set_publicidad, only: [:show, :edit, :update, :destroy]
  skip_before_action :no_autoriza, only: [:index, :show]

  def verifica_user
    @usu =  lambda {usu?}
    @total = lambda {usu_total?}
    @publi = lambda {usu_publi?}
  end

  # GET /publicidads
  # GET /publicidads.json
  def index
    verifica_user
    @publicidads = Publicidad.all

  end

  # GET /publicidads/1
  # GET /publicidads/1.json
  def show
    verifica_user
  end

  # GET /publicidads/new
  def new
    verifica_user
    (usu_total? || usu_publi?) ? @publicidad = Publicidad.new : (redirect_to login_url, notice: "Sin privilegios de publicidad")

  end

  # GET /publicidads/1/edit
  def edit
    verifica_user
    if (usu_total? || usu_publi?)
    else
      (redirect_to login_url, notice: "Sin privilegios de Publicista")
    end
  end

  # POST /publicidads
  # POST /publicidads.json
  def create
    verifica_user
    if (usu_total? || usu_publi?)
      @publicidad = Publicidad.new(publicidad_params)

      respond_to do |format|
        if @publicidad.save
          format.html { redirect_to @publicidad, notice: 'Publicidad was successfully created.' }
          format.json { render :show, status: :created, location: @publicidad }
        else
          format.html { render :new }
          format.json { render json: @publicidad.errors, status: :unprocessable_entity }
        end
      end
    else
      (redirect_to login_url, notice: "Sin privilegios de publicista")
    end
  end

  # PATCH/PUT /publicidads/1
  # PATCH/PUT /publicidads/1.json
  def update
    verifica_user
    if (usu_total? || usu_publi?)
      respond_to do |format|
        if @publicidad.update(publicidad_params)
          format.html { redirect_to @publicidad, notice: 'Publicidad was successfully updated.' }
          format.json { render :show, status: :ok, location: @publicidad }
        else
          format.html { render :edit }
          format.json { render json: @publicidad.errors, status: :unprocessable_entity }
        end
      end
    else
      (redirect_to login_url, notice: "Sin privilegios de publicista")
    end
  end

  # DELETE /publicidads/1
  # DELETE /publicidads/1.json
  def destroy
    verifica_user
    if (usu_total? || usu_publi?)
      @publicidad.destroy
      respond_to do |format|
        format.html { redirect_to publicidads_url, notice: 'Publicidad was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      (redirect_to login_url, notice: "Sin privilegios de publicista")
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publicidad
      @publicidad = Publicidad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publicidad_params
      params.require(:publicidad).permit(:title, :description, :image_url, :publi_url)
    end
end
