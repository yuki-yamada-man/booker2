class UsersController < ApplicationController
  def index
    @user=User.all
  end

  def show
  end

  def edit
  end

  def update
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image_id)
  end
end
