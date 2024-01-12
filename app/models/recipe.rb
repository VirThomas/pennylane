class Recipe < ApplicationRecord
    include PgSearch::Model
    pg_search_scope(
      :search,
      against: :ingredients_tsvector,
      using: {
        tsearch: { any_word: true },
        trigram: { threshold: 0.1 }
      }
    )
end