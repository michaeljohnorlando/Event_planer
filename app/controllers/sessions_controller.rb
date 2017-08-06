class SessionsController < ApplicationController
  def log_in
    @session = Session.new
    @session.login = true
  end
  def log_out
    @session = Session.new
    @session.login = false
  end
end
