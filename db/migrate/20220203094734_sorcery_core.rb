class SorceryCore < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :email, :string
    add_column :users, :crypted_password, :string
    add_column :users, :salt, :string
    add_column :users, :role, :integer, default: 0
  end
end
