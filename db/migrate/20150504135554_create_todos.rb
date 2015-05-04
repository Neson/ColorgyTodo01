class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.boolean :done
      t.string :title
      t.text :description

      t.timestamps null: false
    end
    add_index :todos, :done
  end
end
