class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :gender, null: false
      t.integer :limit_level, null: false

      t.timestamps
    end
  end
end
