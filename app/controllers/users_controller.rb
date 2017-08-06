class UsersController < ApplicationController

  def new
    puts "\n\nusers_controller new: opening the users/new page\n\n"
    @user = User.new
  end
  def params_user
    params.require(:user).permit(:name, :password)
  end
  def create
    puts "\n\nusers_controller create:  running"
    @user = User.new(params_user)
    @user.save
    redirect_to 'uers/new'
  end

end
