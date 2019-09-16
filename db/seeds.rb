# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Genre.delete_all
Book.delete_all
BookGenre.delete_all
Author.delete_all

genres = [
    "Drama",
    "Fairytale",
    "Health",
    "Fantasy",
    "History",
    "Math",
    "Horror",
    "Romance"
]

genres.each do |genre|
  g= Genre.create( name: genre )
  puts "Genre #{g.name} successfully saved."
end

books = [
    { isbn: "978-1-940313-09-0", title: "Hanggang sa dulo ng walang hanggan", date_published: Date.today - 1,
        authors_attributes: [{firstname: "Greg", middlename: "Olegario", lastname: "Lopez" }],
        book_genres_attributes: [{genre_id: Genre.first.id}]
    },
    { isbn: "978-1-940313-09-1", title: "Ulan sa ilalim ng araw", date_published: Date.today - 1,
        authors_attributes: [{firstname: "Greg", middlename: "Olegario", lastname: "Lopez" }],
        book_genres_attributes: [{genre_id: Genre.first.id}]
    },
    { isbn: "978-1-940313-09-2", title: "My Love from the star", date_published: Date.today - 1,
        authors_attributes: [
          {firstname: "Peter", middlename: "Madrid", lastname: "Dela Cruz" },
          {firstname: "Roman", middlename: "Madrid", lastname: "Mercado" },
          {firstname: "Gina", middlename: "Lopez", lastname: "Peralta" }
        ],
        book_genres_attributes: [{genre_id: Genre.last.id}, {genre_id: Genre.last.id}]
    },
    { isbn: "978-1-940313-09-3", title: "My Love from the star", date_published: Date.today - 1,
        authors_attributes: [{firstname: "Gina", middlename: "Lopez", lastname: "Peralta" }],
        book_genres_attributes: [{genre_id: Genre.first.id}]
    },
    { isbn: "978-1-940313-09-4", title: "My Love from the star", date_published: Date.today - 1,
        authors_attributes: [{firstname: "Greg", middlename: "Olegario", lastname: "Lopez" }],
        book_genres_attributes: [{genre_id: Genre.first.id}]
    },
    { isbn: "978-1-940313-09-5", title: "My Love from the star", date_published: Date.today - 1,
        authors_attributes: [{firstname: "Roman", middlename: "Madrid", lastname: "Mercado" }],
        book_genres_attributes: [{genre_id: Genre.first.id}]
    },
    { isbn: "978-1-940313-09-6", title: "My Love from the star", date_published: Date.today - 1,
        authors_attributes: [{firstname: "Greg", middlename: "Olegario", lastname: "Lopez" }],
        book_genres_attributes: [{genre_id: Genre.first.id}]
    },
    { isbn: "978-1-940313-09-7", title: "My Love from the star", date_published: Date.today - 1,
        authors_attributes: [{firstname: "Greg", middlename: "Olegario", lastname: "Lopez" }],
        book_genres_attributes: [{genre_id: Genre.first.id}]
    },
    { isbn: "978-1-940313-09-8", title: "My Love from the star", date_published: Date.today - 1,
        authors_attributes: [{firstname: "Greg", middlename: "Olegario", lastname: "Lopez" }],
        book_genres_attributes: [{genre_id: Genre.first.id}]
    },
    { isbn: "978-1-940313-09-9", title: "My Love from the star", date_published: Date.today - 1,
        authors_attributes: [{firstname: "Greg", middlename: "Olegario", lastname: "Lopez" }],
        book_genres_attributes: [{genre_id: Genre.first.id}]
    }
]

books.each do |book_params|
  b = Book.create(book_params)
  puts "Book #{b.isbn} successfully saved."
end
