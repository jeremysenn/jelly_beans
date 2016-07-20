module SessionsHelper
  
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
    session[:company_id] = user.company_id
#    session[:auth_token]= user.access_token.token_string
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  # Returns the current logged-in user's company (if any).
  def current_company
    @current_company ||= Company.find_by(id: session[:company_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
  
  def log_out
#    session.delete(:user_id)
    reset_session
    @current_user = nil
    @current_company = nil
#    session.delete(:auth_token)
  end
  
  def login_required
    unless logged_in?
      store_target_location
      flash[:danger] = "You must first log in or sign up before accessing this page."
      redirect_to root_path
    else
      session[:user_id] = current_user.id
    end
  end
  
  private

  def store_target_location
    session[:return_to] = request.url
  end
  
end
