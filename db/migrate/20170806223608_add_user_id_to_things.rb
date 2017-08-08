class AddUserIdToThings < ActiveRecord::Migration[5.1]
  def change
    add_column :thing_to_dos, :user_id,    :intiger
  end
end
