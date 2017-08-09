class ChangeDataTypeForEvents < ActiveRecord::Migration[5.1]

  def up
    change_column :thing_to_dos, :attending, :string, array: true, default: '{}'
  end

  def down
    change_column :thing_to_dos, :attending, :integer
  end

end
