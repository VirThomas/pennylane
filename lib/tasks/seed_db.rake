namespace :seed_db do
  desc "seed db with recipes-fr.json"
  task run: :environment do
    json_data = File.read('recipes.json')
    recipes = JSON.parse(json_data)

    Recipe.import recipes
  end
end