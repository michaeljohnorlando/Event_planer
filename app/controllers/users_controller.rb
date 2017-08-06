class UsersController < ApplicationController

  def new
    puts "\n\n users_controller new: opening the users/new page \n\n"
    @user = User.new
  end
  def params_user
    params.require(:user).permit(:name, :password)
  end

  # how to make a loggin and session help
  # http://railscasts.com/episodes/250-authentication-from-scratch?autoplay=true
  def create
    puts "\n\n users_controller create:  running \n\n"
    # Create a new user
    @user = User.new(params_user)
    if @user.save
      # Change ID session login to true
      @session = Session.new
      # need to make shure there arent more then one
      # need a timmer to delete automaticly in a day or 2
      id  = SecureRandom.hex(64)
      key = SecureRandom.hex(64)
      @session.session_id = id
      @session.key        = key
      @session.user_id    = @user.id
      @session.save
      # Save ID and random temp hash in cookie
      cookies[:session_id] = id
      cookies[:key]        = key
      # go to homepage
      redirect_to '/Events/homepage'
    end
  end

end
