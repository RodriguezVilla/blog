class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  before_action :no_autoriza



  # GET /users
  # GET /users.json
  def index
  (User.find_by(id: session[:user_id])).tipo=="Total" ? @users = User.order(:name) : (redirect_to login_url, notice: "Sin privilegios de administrador total")


  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    (User.find_by(id: session[:user_id])).tipo=="Total" ? @user = User.new : (redirect_to login_url, notice: "Sin privilegios de administrador total")

  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    (User.find_by(id: session[:user_id])).tipo=="Total" ? @user = User.new(user_params) : (redirect_to login_url, notice: "Sin privilegios de administrador total")



    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: "El usuario/a #{@user.name} ha sido creado/a" }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    unless (User.find_by(id: session[:user_id])).tipo=="Total"
      redirect_to login_url, notice: "Sin privilegios de administrador total"
    end
    respond_to do |format|
      if @user.update(user_params)
format.html { redirect_to users_url, notice: "El usuario/a #{@user.name} ha sido creado/a" }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, :tipo)
    end
end
