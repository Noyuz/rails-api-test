class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :name
      t.string :subject
      t.integer :maximum_score

      t.timestamps
    end
  end
end
