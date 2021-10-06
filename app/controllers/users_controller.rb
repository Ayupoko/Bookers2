class UsersController < ApplicationController
 
   def new
    @book = Book.new
   end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to books_path
  end
 
 def index
     @user = current_user
     @users = User.all
     @book = Book.new
 end
 
  def show
     @user = User.find(params[:id])
     @books = @user.books
     @book = Book.new
  end
  
  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
        redirect_to user_path(current_user)
    end
        
  end
 
   def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:updateU] = 'You have updated user successfully.'
    redirect_to user_path(@user.id) 
    else
    render :edit
    end
   end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

 
end
