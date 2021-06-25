class AddNewAttributesToViewedTests < ActiveRecord::Migration[6.1]
  def change
    add_reference :viewed_tests, :current_question, foreign_key: { to_table: :questions }
    add_column :viewed_tests, :correct_questions, :integer, null: false, default: 0
  end
end
