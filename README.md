# Pennylane-Assessment (Might call it Cook-eat)
## _The Best Recipes Search Engine, Ever_
****
If you feel lazy to read everything, just try it here : https://pennylane-iyev.onrender.com/
****
<br>


This assessment is seeded with recipes scrapped on marmiton.org (almost 10k of it !).
It allows you to type in the search bar ingredients separated with a space and it will
give you recipes that matches your ingredients 🥔🥒🥩🧑‍🍳

<br>
## Features 🚀

- Search for recipes matching your fridge's ingredients
- TODO 🚧 : Improve UI/UX (Add spinner for loading results, display recipes in rows)
- TODO 🚧 : Auth user to bookmark recipes

## Tech 💻

This assessment uses a number of open source projects to work properly:

- [Ruby on Rails] - A web-app framework that includes everything needed to create database-backed web applications according to the Model-View-Controller (MVC) pattern.  
- [PgSearch] - PgSearch builds named scopes that take advantage of PostgreSQL's full text search.
- [ReactJs] - An open-source JavaScript library, crafted with precision by Facebook, that aims to simplify the intricate process of building interactive user interfaces.
- [Postgresql] - PostgreSQL is a free and open-source relational database management system (RDBMS) emphasizing extensibility and SQL compliance.
- [MaterialUI] -  An open-source React component library that implements Google's Material Design.
- [Render] - Cloud Application Hosting for Developers

It's hosted here if you want to try it : https://pennylane-iyev.onrender.com/

## Installation 🔨

Install the dependencies and start the server (back AND front).

Rails API :
```sh
cd pennylane
bundle i
rails db:create && rails db:migrate
rake seed_db:run (to seed the database with the given file)
rails s (this will run your server on port 3002)
```

React client :

```sh
cd pennylane-front
npm i
touch .env
echo "REACT_APP_ENDPOINT_URL=http://localhost:3002/api/v1/search" >> .env
npm start   
```

## A deeper look 🔍
Here is the core of the search feature :
 ```ruby
class Recipe < ApplicationRecord
    include PgSearch::Model
    pg_search_scope(
      :search,
      against: :ingredients_tsvector,
      using: {
        tsearch: {
          any_word: true,
          prefix: true
       },
        trigram: { threshold: 0.1 }
      }
    )
end
```
```against:``` tells pg_search_scope which column or columns to search against.  
```tsearch:``` tsearch is the option for Full Text Searching - considers query as a set of words and similarity as the frequency of query words in the document.  
```trigram:``` trigram search works by counting how many three-letter substrings (or "trigrams") match between the query and the text.  
```any_word:``` Setting this attribute to true will perform a search which will return all models containing any word in the search terms. (Absolutely mandatory in order to perform a query with multiple args and have results otherwise it will expect a perfect match with the query params)  
```threshold:``` set to lower numbers match more permissively, letting in more results.  
```prefix:``` If you want to search for partial words, however, you can set :prefix to true. (Allows us to query singular and have plural but also gives more weight in ranking to recipes with two times the same ingredient)


**I hope you enjoyed reading this readme ! 🎉**

   [ReactJs]: <https://fr.react.dev>
   [PgSearch]: <https://github.com/Casecommons/pg_search>
   [Postgresql]: <https://www.postgresql.org>
   [Ruby on Rails]: <https://rubyonrails.org/>
   [MaterialUI]: <https://mui.com>
   [Render]: <https://render.com>
   
