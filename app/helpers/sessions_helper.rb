module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end


  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    else
      @current_user = nil
    end
  end

  def remember(user)
    #use the User method remember
    user.remember
    #create the 2 cookies one for id and one with the remember_token
    cookies.permanent[:remember_token] = user.remember_token
    cookies.permanent.signed[:id] = user.id
  end

  def forget(user)
    #use the User method forget
    user.forget
    #delete the 2 cookies
    cookies.delete(:id)
    cookies.delete(:remember_token)
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

end
