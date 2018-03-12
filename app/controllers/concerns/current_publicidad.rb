module CurrentPublicidad
  extend ActiveSupport::Concern
#Mostrar PublicidadsController
def mostrar_publicidad
    @publicidads = Publicidad.all
end



  private

end
