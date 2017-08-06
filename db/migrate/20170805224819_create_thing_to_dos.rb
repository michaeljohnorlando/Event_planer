class CreateThingToDos < ActiveRecord::Migration[5.1]
  def change
    create_table :thing_to_dos do |t|
      t.string :name
      t.text :description
      t.integer :attending

      t.timestamps
    end
  end
end
