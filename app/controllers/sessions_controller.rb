class SessionsController < ApplicationController

  def params_user
    params.require(:user).permit(:name, :password)
  end
  def params_session(session_id,user_id)
    params.permit(session_id, user_id)
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

        # need to make shure there arent more then one
        # need a timmer to delete automaticly in a day or 2
        @session = Session.new
        id  = SecureRandom.hex(64)
        @session.session_id = id
        puts "\n\nthe user id:  #{@check.id}\n\n"
        @session.user_id    = @check.id
        puts " save? #{@session.user_id}"
         if @session.save
           puts "save sucsessfull "
         else
           puts " not saved! "
         end

        # Save ID and random temp hash in cookie
        cookies[:session_id] = id
        puts "#{cookies[:session_id]}"
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
