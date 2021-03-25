class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
     t.string :name, null: false  
     t.text :information, null: false  
     t.text :city,  null: false  
     t.references :user, null: false, foreign_key:true 
     t.integer :water_supply_id, null: false  
     t.integer :socket_id, null: false  
     t.integer :toilet_id, null: false 
     t.integer :bath_id, null: false  
     t.integer :parking_id, null: false 
     t.integer :phone_number 
     t.string   :web_site     
     t.timestamps
    end
  end
end
