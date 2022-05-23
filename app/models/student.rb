class Student < ApplicationRecord
  has_many :test_results

  def full_name
    "#{first_name} #{last_name}"
  end

  def scores
    test_results.map(&:score)
  end

  def to_stats(numbers)
    { highest_score: numbers.max, lowest_score: numbers.min, median: median(numbers), average: average(numbers) }
  end

  def average(numbers)
    (numbers.sum.fdiv(numbers.size)).round(2)
  end

  def median(numbers)
    sorted_array = numbers.sort
    count = sorted_array.count

    if sorted_array.count.even?
      first_half = (sorted_array[0...(count/2)])
      second_half = (sorted_array[(count/2)..-1])

      first_median = first_half[-1]
      second_median = second_half[0]

      true_median = ((first_median + second_median).to_f / 2)
    else
      true_median = sorted_array[(count/2).floor]
    end
    true_median
  end

  def average_score
    average(scores)
  end

  def median_score
    median(scores)
  end

  def stats
    to_stats(scores)
  end

end
