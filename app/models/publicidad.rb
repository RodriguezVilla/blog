class Publicidad < ApplicationRecord
    
    mount_uploader :image_url, FotoUploader

    validates :title, :description, :image_url, :publi_url, presence: true
   
end
