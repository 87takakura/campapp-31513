class CreateCampposts < ActiveRecord::Migration[6.0]
  def change
    create_table :campposts do |t|
      t.string :name, null: false
      t.text :information, null: false
      t.integer :prefecture_id, null: false
      t.text :city, null: false
      t.references :user, null: false, foreign_key: true
      t.integer :watersupply_id, null: false
      t.integer :outlet_id, null: false
      t.integer :fire_id, null: false
      t.integer :cargetin_id, null: false    
      t.integer :toilet_id, null: false
      t.integer :bath_id, null: false
      t.integer :parking_id, null: false
      t.integer :phone_number
      t.string :web_site
      t.timestamps
    end
  end
end
