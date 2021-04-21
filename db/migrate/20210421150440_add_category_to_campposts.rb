class AddCategoryToCampposts < ActiveRecord::Migration[6.0]
  def change
    add_reference :campposts, :category, foreign_key: true
  end
end
