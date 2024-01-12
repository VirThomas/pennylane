class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.float :rate
      t.string :author_tip
      t.string :budget
      t.string :prep_time
      t.text :ingredients, array: true, default: []
      t.string :author
      t.string :difficulty
      t.integer :people_quantity
      t.string :cook_time
      t.text :tags, array: true, default: []
      t.string :total_time
      t.string :image
      t.integer :nb_comments
      t.timestamps
    end
  end
end
