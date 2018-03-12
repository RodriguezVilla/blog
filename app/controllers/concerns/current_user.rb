module CurrentUser
  extend ActiveSupport::Concern

  ##Evaluando acceso
  def usu?
    unless User.find_by(id: session[:user_id])
      return false
    else
      return true
    end
  end
  def usu_total?
    user = User.find_by(id: session[:user_id])
    (user.tipo=="Total") ? true : (false)
  end
  def usu_blog?
    user = User.find_by(id: session[:user_id])
    (user.tipo=="Blog") ? true : (false)
  end
  def usu_publi?
    user = User.find_by(id: session[:user_id])
    (user.tipo=="Publicidad") ? true : (false)
  end

end
