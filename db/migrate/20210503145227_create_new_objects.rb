# frozen_string_literal: true

class CreateNewObjects < ActiveRecord::Migration[6.1]
  def change
    create_table :new_objects do |t|
      t.string :title

      t.timestamps
    end
  end
end
