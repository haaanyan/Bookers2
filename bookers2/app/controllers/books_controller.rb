class BooksController < ApplicationController

def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
end

def index
    @user = current_user
    @book = Book.new
    @books = Book.all
end


def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to user_path(current_user)
end

def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
        render "edit"
    else
        redirect_to books_path
    end
end

def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    @book.update(book_params)
    redirect_to book_path(@book.id)
end

def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
end

private
def book_params
    params.require(:book).permit(:title, :body)
end

end