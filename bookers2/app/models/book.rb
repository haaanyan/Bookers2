class Book < ApplicationRecord

  validates :title, presence:true
  validates :body, presence:true

  belongs_to :user
  attachment :profile_image

end
