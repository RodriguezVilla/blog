class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include CurrentPublicidad
  include CurrentComment

  before_action :no_autoriza
#  before_action :usuario_total_o_publicidad?
#  before_action :autoriza_total
#  before_action :autoriza_blog
#  before_action :autoriza_publicidad

  protected

  def no_autoriza
    user = User.find_by(id: session[:user_id])
      unless (user)
        redirect_to login_url, notice: "Please log in"
      end
  end

end
