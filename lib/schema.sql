CREATE TABLE series (
    id INTEGER PRIMARY KEY,
    title TEXT,
    author_id TEXT, 
    subgenre_id TEXT
);

CREATE TABLE subgenres (
    id INTEGER PRIMARY KEY,
    name TEXT
);

CREATE TABLE authors (
    id INTEGER PRIMARY KEY,
    name TEXT
);

CREATE TABLE books (
    id INTEGER PRIMARY KEY,
    title TEXT,
    year INTEGER,
    series_id TEXT
);

CREATE TABLE characters (
    id INTEGER PRIMARY KEY,
    name TEXT,
    motto TEXT,
    species TEXT,
    author_id TEXT
);

CREATE TABLE character_books (
    id INTEGER PRIMARY KEY,
    book_id TEXT,
    character_id TEXT
);