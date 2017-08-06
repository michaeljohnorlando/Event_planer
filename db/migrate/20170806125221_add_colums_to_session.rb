class AddColumsToSession < ActiveRecord::Migration[5.1]
  def change
    add_column :sessions, :session_id, :text
    add_column :sessions, :key,        :text
    add_column :sessions, :user_id,    :intiger
  end
end
