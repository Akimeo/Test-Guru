class AddNewAttributesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :password_digest, :string, null: false
    add_column :users, :email, :string, null: false
  end
end
