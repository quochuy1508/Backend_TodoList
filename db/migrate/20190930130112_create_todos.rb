class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :title
      t.boolean :isPending, default: true
      t.boolean :isDoing, default: false
      t.boolean :isDone, default: false
      t.integer :priority, default: 0
      t.string :created_by

      t.timestamps
    end
  end
end
