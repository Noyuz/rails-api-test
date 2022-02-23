module Api
  module V1
    class TestsController < ApplicationController
      before_action :load_test, except: %i[show update destroy]

      def index
        @tests = Test.all

        render json: @tests
      end

      def show
        render json: @test
      end

      def create
        @test = Test.new(test_params)

        if @test.save
          render json: @test, status: :created, location: @test
        else
          render json: @test.errors, status: :unprocessable_entity
        end
      end

      def update
        if @test.update(test_params)
          render json: @test
        else
          render json: @test.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @test.destroy
      end

      def stats
        results = @test.results.order(score: :asc).pluck(:score)

        # Compute highest score...
        @highest = results.max

        # Compute lowest score...
        @lowest = results.min

        # Compute median score...
        center = results.size / 2
        @median = results.size.even? ? (results[center] + results[center + 1]) / 2 : results[center]

        # Compute average score...
        @average = results.sum / results.size

        render json: {
          student_scores: {
            max: @highest,
            min: @lowest,
            average: @average,
            median: @median
          },
          maximum_possible_score: @test.maximum_score
        }
      end

      private

      def load_test
        @test = Test.find(params[:id])
      end

      def test_params
        params.require(:test).permit(:name, :subject, :maximum_score)
      end
    end
  end
end
