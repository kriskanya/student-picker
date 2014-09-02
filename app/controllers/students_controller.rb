class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to root_path, notice: "Student named #{@student.name} has been created"
    else
      flash.now[:alert] = "Student could not be created"
      render :new
    end
  end

  def select
    redirect_to root_path
  end

  def update
  end

  protected

  def student_params
    params.require(:student).permit(:name, :last_called)
  end

end
