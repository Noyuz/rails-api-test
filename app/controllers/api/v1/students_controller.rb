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
        case params[:subject]
        when 'math'
          render json: @student.to_stats(@student.test_results.reject { |test| test.test_id > 3 }.map(&:score))
          # renvoyer les stats des sujets math
        when 'engineering'
          render json: @student.to_stats(@student.test_results.select { |test| [4, 5].include?(test.test_id) }.map(&:score))
          # renvoyer les stats des sujets engineering
        when 'physics'
          render json: @student.to_stats(@student.test_results.select { |test| [6, 7].include?(test.test_id) }.map(&:score))
          # renvoyer les stats des sujets physics
        else
          render json: @student.stats
        end

        # Question 4 :
        # mettre les scores avec un maximum_score commun
        #
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
