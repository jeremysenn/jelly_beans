class SessionsController < ApplicationController

  def index
  end

  def new
  end

  def create
#    token = Token.authenticate(params[:username], params[:password])
    user = User.where(email: params[:email]).first
#    if token
    if user
      helpers.log_in user
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid user"
      render "new"
    end
  end
  
#  def create
#    user = User.authenticate(params[:username], params[:password], params[:dragon_account_number])
#    if user
#      cookies.permanent[:dragon_account_number] = user.dragon_account_number # Store Dragon account number in a permanent cookie so can remember next time.
#      if user.email_confirmed
#        log_in user
#        unless user.user_setting.currency_id.blank? and not user.customer?
#          flash[:success] = "You have been logged in."
#          redirect_to root_path
#        else
#          flash[:danger] = "Please verify your settings before proceeding."
#          redirect_to edit_user_setting_path(user.user_setting)
#        end
#      else
#        flash.now[:danger] = 'Please activate your account by following the instructions in the account confirmation email you received to proceed'
#        render 'new'
#      end
#    else
#      flash.now[:danger] = "Invalid username or password."
#      render 'new' 
#    end
#  end

  def destroy
    log_out
    flash[:success] = "Logged out!"
    redirect_to root_url
  end

end
