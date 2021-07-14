class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :image_name, null: false
      t.string :rule, null: false
      t.string :value
      t.string :description

      t.timestamps
    end
  end
end
