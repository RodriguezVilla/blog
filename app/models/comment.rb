class Comment < ApplicationRecord
  belongs_to :post
  #belongs_to :comment
  #has_many :comments
end
