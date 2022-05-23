class Test < ApplicationRecord
  has_many :results, class_name: 'TestResult'

  def self.math_subjects
    where(subject: 'math')
  end
end
