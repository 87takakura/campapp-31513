class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.references :user, null: false, foreign_key: true
      t.references :camppost, null: false, foreign_key: true
      t.text :message 
      t.boolean :checked
      t.timestamps
    end
  end
end
