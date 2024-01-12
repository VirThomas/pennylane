class AddGinIndexToIngredientsTsvector < ActiveRecord::Migration[7.1]
  def change
    add_index :recipes, :ingredients_tsvector, using: 'gin'
  end
end
