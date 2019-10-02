class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.string :name
      t.integer :to_id, null: false
      t.integer :from_id, null: false
      t.timestamps
    end
  end
end
