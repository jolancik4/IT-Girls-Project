class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      # Log the user in and redirect to the user's show page.
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    log_out if logged_in?
    session[:user_id] = nil
    redirect_to store_index_url, notice: "Logged out"
  end
end

module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
end