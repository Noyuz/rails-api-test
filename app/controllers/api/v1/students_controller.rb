module Api
  module V1
    class StudentsController < ApplicationController
      before_action :load_student, except: %i[index create]

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

      def stats
        # 1. Implement this action.
        #    It should return highest score, lowest score, median and average scores.
        #
        # 3. Implement a filter based on a query param "subject" permitting filtering of results
        #    For example, /api/v1/students/:id/stats?subject=math will display stats for the "math" subject.
      end

      private

      def load_student
        @student = Student.find(params[:id])
      end

      def student_params
        params.require(:student).permit(:first_name, :last_name, :email, :phone)
      end
    end
  end
end
