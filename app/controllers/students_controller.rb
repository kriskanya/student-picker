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
    if Student.count.zero?
      redirect_to root_path, notice: "You must add a student first"
    else
      student = Student.unpicked.sample
      call_on(student)
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  protected

  def call_on(student)
    if student.nil?
      redirect_to root_path, notice: "Sorry, all students picked in last hour"
    else
      student.last_called = Time.zone.now
      if student.save
        redirect_to root_path, alert: "You have picked #{student.name}"
      else
        redirect_to root_path, alert: "Could not update student time data"
      end
    end
  end

  def student_params
    params.require(:student).permit(:name, :last_called)
  end

end
