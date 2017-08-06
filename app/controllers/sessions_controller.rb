class SessionsController < ApplicationController

  def params_user
    params.require(:user).permit(:name, :password)
  end
  def params_session
    params.require(:session).permit(:session_id, :user_id)
  end

  def login # did this in the User controller and view...
    @user = User.new
  end
  def login_now
    @user = User.new(params_user)
    if User.exists?(name: @user.name)
      puts " \n the user is in the databace \n"
      @check = User.find_by_name(@user.name)
      if @check.authenticate(@user.password)
        puts "\n the password entered is valid \n"


        @session = Session.new
        # need to make shure there arent more then one
        # need a timmer to delete automaticly in a day or 2
        id  = SecureRandom.hex(64)
        @session.session_id = id
        @session.user_id    = @user.id
        puts " save? "
        @session.save
        puts " why rollback?"


        # Save ID and random temp hash in cookie
        cookies[:session_id] = id
        # go to homepage
        redirect_to '/Events/homepage'
      else
        puts "\n the password entered did not match \n "
        puts "\n Entered: #{@user.password_digest} \n Check:  :#{@check.password_digest}"
        redirect_to '/users/login'
      end
    end
  end


  def logout
    @user = User.new # this is not really used... need to use a diffrent form?
  end
  def logout_now
    @session = Session.find_by(session_id: cookies[:session_id])
    if @session
      @session.destroy
      cookies.delete :session_id
      cookies.delete :key
      redirect_to "/Events/homepage"
    else
      "for some reason your session was not found"
    end
  end
end
