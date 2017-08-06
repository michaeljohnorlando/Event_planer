class ApplicationController < ActionController::Base
  #https://stackoverflow.com/questions/35181340/rails-cant-verify-csrf-token-authenticity-when-making-a-post-request
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
end
