class Book < ApplicationRecord

  validates :title, presence:true
  validates :body, presence:true, length: { maximum:200}

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def Book.search (search, model, how)
    if how == "perfect_match"
      Book.where("title LIKE?", "#{search}")
      elsif how == "forward_match"
        Book.where("title LIKE?", "#{search}%")
        elsif how == "backword_match"
          Book.where("title LIKE?", "%#{search}")
          elsif how == "partial_match"
            Book.where("title LIKE?", "%#{search}%")
          end

        end


 end
