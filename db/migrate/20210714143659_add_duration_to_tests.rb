class AddDurationToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :duration, :integer, null: false, default: 300
  end
end
