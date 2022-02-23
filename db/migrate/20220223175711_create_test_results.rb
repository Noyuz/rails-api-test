class CreateTestResults < ActiveRecord::Migration[6.1]
  def change
    create_table :test_results do |t|
      t.references :test, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.integer :score
      t.text :comment

      t.timestamps
    end

    add_index :test_results, %i[test_id student_id], unique: true
  end
end
