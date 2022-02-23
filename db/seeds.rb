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
students = Students.create!([
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
