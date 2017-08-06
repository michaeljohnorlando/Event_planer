class User < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name,     :string
    add_column :users, :going_to, :integer
    add_column :users, :password, :bycript
  end
end
