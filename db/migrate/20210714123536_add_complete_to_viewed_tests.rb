class AddCompleteToViewedTests < ActiveRecord::Migration[6.1]
  def change
    add_column :viewed_tests, :complete, :boolean, null: false, default: false
  end
end
