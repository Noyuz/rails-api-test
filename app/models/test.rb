class Test < ApplicationRecord
  has_many :results, class_name: 'TestResult'
end
