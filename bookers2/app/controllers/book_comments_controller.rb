class BookCommentsController < ApplicationController
  before_action :authenticate_user!


  def create
    @book = Book.find(params[:book_id])
    @book_new = Book.new
    @book_comment = @book.book_comments.new(book_comment_params)
    @book_comment.user_id = current_user.id
    @book_comment.save
    redirect_back(fallback_location: root_path)

  end

  def destroy

    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    redirect_back(fallback_location: root_path)

  end


  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end


end
