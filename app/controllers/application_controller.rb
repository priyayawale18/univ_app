class ApplicationController < ActionController::Base
 
 before_action :require_user

  helper_method :current_user, :loggen_in?
  def current_user
    @current_user ||= Student.find(session[:student_id]) if session[:student_id]
  end

  def loggen_in?
  	!!current_user 
  end
   
  def require_user
     if !loggen_in?
      flash[:notice] = "You must be logged in to perform that action"
      redirect_to login_path   
     end
  end 
end
