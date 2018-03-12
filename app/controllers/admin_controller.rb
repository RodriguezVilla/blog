class AdminController < ApplicationController
  skip_before_action :no_autoriza
  #skip_before_action :autoriza_publicidad
  #skip_before_action :autoriza_total
  #skip_before_action :autoriza_blog
  def index
   @user = User.find_by(id: session[:user_id])
    @user_tipo =@user.tipo
    @user_name =@user.name
  end
end
