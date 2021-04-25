class CreateCamppostsearches < ActiveRecord::Migration[6.0]
  def change
    create_table :camppostsearches do |t|
      t.string      :name,  null: false
      t.references  :category, foreign_key: true
      t.timestamps
    end
  end
end