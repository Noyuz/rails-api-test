module Api
  module V1
    class TestResultsController < ApplicationController
      before_action :load_test, only: %i[index create]
      before_action :load_test_result, only: %i[show update destroy]

      def index
        @test_results = Test.results.all

        render json: @test_results
      end

      def show
        render json: @test_result
      end

      def create
        @test_result = Test.results.new(test_result_params)

        if @test_result.save
          render json: @test_result, status: :created, location: @test_result
        else
          render json: @test_result.errors, status: :unprocessable_entity
        end
      end

      def update
        if @test_result.update(test_result_params)
          render json: @test_result
        else
          render json: @test_result.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @test_result.destroy
      end

      private

      def load_test_result
        @test_result = TestResult.find(params[:id])
      end

      def test_result_params
        params.require(:test_result).permit(:student_id, :score, :comment)
      end
    end
  end
end
