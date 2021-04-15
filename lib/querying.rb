def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT title, year
  FROM books
  WHERE series_id = 1"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto
  FROM characters
  ORDER BY LENGTH(motto) DESC
  LIMIT 1" 
end


def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species) AS total
  FROM characters
  GROUP BY species
  ORDER BY total DESC
  LIMIT 1"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name
  FROM authors
  JOIN series
  ON authors.id = series.author_id
  JOIN subgenres
  ON series.subgenre_id = subgenres.id"
end

def select_series_title_with_most_human_characters
  "
  WITH good_series AS (SELECT series.title, COUNT(DISTINCT character_id) as total
  FROM series
  JOIN books
  ON books.series_id = series.id
  JOIN character_books
  ON character_books.book_id = books.id
  JOIN characters
  ON character_books.character_id = characters.id
  WHERE characters.species = 'human'
  GROUP BY series.id
  ORDER BY total DESC)  
  SELECT title
  FROM good_series
  LIMIT 1

  "
  # SELECT series.id, books.id
  # FROM series
  # JOIN books
  # ON books.series_id = series.id
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, x.count
  FROM characters
  JOIN (SELECT character_books.character_id, COUNT(*) AS count
  FROM character_books
  GROUP BY character_books.character_id
  ORDER BY COUNT(*) DESC) AS x
  ON characters.id = x.character_id"
end
