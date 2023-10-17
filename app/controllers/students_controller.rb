class StudentsController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]
  before_action :set_student, only: [:show, :edit, :update]
  before_action :require_same_user, only: [:edit,:update]

	def index
		@students = Student.all
	end

	def new
		@student = Student.new
	end

	def show
	#@student  = Student.find(params[:id])
	end

	def create
     @student = Student.new(student_params)
     if @student.save
       flash[:notice] = "You have successfully signed up"
       redirect_to root_path
     else
     	render 'new'
     end
	end

	def edit
	#@student = Student.find(params[:id])
	end

    def update
    #@student = Student.find(params[:id])
    	if @student.update(student_params)
    		 flash[:notice] = "You have successfully Updated your profile"
    		 redirect_to student_path(@student)
        else
          render 'edit'
        end
    end

	private

	def set_student
		@student = Student.find(params[:id])
	end

	def student_params
		params.require(:student).permit(:name, :email, :password, :password_confirmation)
    end
  
  def require_same_user
  	if current_user != @student
  		flash[:notice]= "You can edit your own profile"
  		redirect_to student_path(current_user)
  	end
  end 

end
