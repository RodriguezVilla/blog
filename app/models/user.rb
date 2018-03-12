class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_secure_password
  ADMIN_TYPES=["Total", "Blog", "Publicidad"]
end
