class LoginsController < ApplicationController

  skip_before_action :require_user, only: [:new, :create]
 # before_action :require_user, only: [:index, :show]
  


   def new

   end

   def create
      student = Student.find_by(email: params[:logins][:email].downcase)
      if student && student.authenticate(params[:logins][:password])
        flash[:notice] = "You have successfully logged in"
         session[:student_id] = student.id
         redirect_to student
      else
       flash[:notice] = "Something was wrong with your login information"
       render 'new'
      end
   end

   def destory
     session[:student_id] = nil
     flash[:notice] = "You have successfully logged out"
     redirect_to root_path
   end

end
