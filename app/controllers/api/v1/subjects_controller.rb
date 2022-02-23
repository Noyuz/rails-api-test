module Api
  module V1
    class SubjectsController < ApplicationController
      def stats
        # 4. Fix this so the scores are properly pondered out of 20 points.
        #    For example, if there is two tests for a subject,
        #    and we have 10/20 and 30/40, the proper average should be
        #    (10+(30/2))/2 = 12 and **not** (10+30)/2 = 30
        @tests = Test.where(subject: params.require(:subject))

        results = @tests.map { |t| t.results.pluck(:score) }
                        .flatten.sort

        # Compute highest score...
        @highest = results.max

        # Compute lowest score...
        @lowest = results.min

        # Compute average score...
        @average = (results.sum / results.size unless results.size.zero?)

        # Compute median score...
        begin
          center = results.size / 2
          @median = results.size.even? ? (results[center] + results[center + 1]) / 2 : results[center]
        rescue TypeError, NoMethodError => e
          # If the series has two or less values, the above method of computation will fail.
          # However, in both those cases, median == average so we have a backup.
          @median = @average
        end

        render json: {
          scores: {
            max: @highest,
            min: @lowest,
            average: @average,
            median: @median
          },
          tests: @tests.pluck(:name)
        }
      end
    end
  end
end
