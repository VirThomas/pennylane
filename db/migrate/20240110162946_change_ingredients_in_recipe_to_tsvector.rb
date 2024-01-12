class ChangeIngredientsInRecipeToTsvector < ActiveRecord::Migration[7.1]
  def up
    add_column :recipes, :ingredients_tsvector, :tsvector
    execute <<-SQL
      UPDATE recipes
      SET ingredients_tsvector = to_tsvector('english', array_to_string(ingredients, ' '))
    SQL
  end

  def down
    remove_column :recipes, :ingredients_tsvector
  end
end
