class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

    mount_uploader :img_destacada_url, FotoUploader
    validates :titulo, :descripticion, presence: true
    validates :titulo, uniqueness: true
  #  validates :img_destacada_url, allow_blank: true, format: {
  #           with: %r{\.(gif|jpeg|jpg|png)\Z}i,
  #           messsage:"must be a URL for GIF, JPG or PNG image." }
end
