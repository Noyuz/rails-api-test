# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Please note that seeds should not be used for creating development data in this way.
# Seeds should only be used for creating default data (eg: list of all countries) necessary for the app to run.
# We only use this file like this for simplicity's sake in this exercise.
students = Student.create!([
                             {
                               first_name: 'James',
                               last_name: 'Strieb',
                               email: 'james.strieb@lmg.com',
                               phone: '+32554682346'
                             },
                             {
                               first_name: 'Linus',
                               last_name: 'Sebastian',
                               email: 'linus.sebastian@lmg.com',
                               phone: '+78346456456'
                             },
                             {
                               first_name: 'Benjamin',
                               last_name: 'Gauthier',
                               email: 'benjamin.gauthier@comeen.io',
                               phone: '+33233489877'
                             },
                             {
                               first_name: 'Simon',
                               last_name: 'Cleriot',
                               email: 'simon.cleriot@comeen.io',
                               phone: '+33765203285'
                             },
                             {
                               first_name: 'Rodolphe',
                               last_name: "d'Aragon",
                               email: 'rodolphe.daragon@comeen.io',
                               phone: '+33758673288'
                             },
                             {
                               first_name: 'Marty',
                               last_name: 'Lamoureux',
                               email: 'marty.lamoureux@comeen.io',
                               phone: '+335873930576'
                             }
                           ])

tests = Test.create!([
                       {
                         name: 'Basic arythmetic',
                         subject: 'math',
                         maximum_score: 40
                       },
                       {
                         name: 'Spacial geometry',
                         subject: 'math',
                         maximum_score: 20
                       },
                       {
                         name: 'Applied statistics',
                         subject: 'math',
                         maximum_score: 50
                       },
                       {
                         name: 'Geothermals',
                         subject: 'physics',
                         maximum_score: 40
                       },
                       {
                         name: 'Atom basics',
                         subject: 'physics',
                         maximum_score: 10
                       },
                       {
                         name: 'Machining theory',
                         subject: 'engineering',
                         maximum_score: 40
                       },
                       {
                         name: 'Production processes',
                         subject: 'engineering',
                         maximum_score: 70
                       }
                     ])

results = []

tests.each do |test|
  scoregen = Rubystats::NormalDistribution.new(test.maximum_score / 2, test.maximum_score / 4)
  students.each do |student|
    results << test.results.create({ student: student, score: scoregen.rng.round.abs })
  end
end
