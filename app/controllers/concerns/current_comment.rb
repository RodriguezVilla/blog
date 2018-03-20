module CurrentComment
  extend ActiveSupport::Concern

  def view_comments
    #Evaluar si existen comentarios
      @comments = Comment.all
  end

  def view_comment
    #@comment =  Comment.new
  end
end
