class UsersController < ApplicationController
  def index
    @user=User.all
  end

  def show
    @user=User.find(params[:id])
    @books=@user.books.page(params[:page]).reverse_order
  end

  def edit
    @user=User.find(params[:id])
    if user_id == current_user
      render edit_user_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id),notice:'User was successfuly updated'
    else
      render :user_path
    end
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image_id)
  end
end
