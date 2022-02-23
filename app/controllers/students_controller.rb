class StudentsController < ApplicationController
  before_action :load_student, only: %i[show update destroy]

  def index
    @students = Student.all

    render json: @students
  end

  def show
    render json: @student
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      render json: @student, status: :created, location: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  def update
    if @student.update(student_params)
      render json: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @student.destroy
  end

  private

  def load_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :phone)
  end
end
