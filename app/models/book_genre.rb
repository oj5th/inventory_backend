class BookGenre < ApplicationRecord
  belongs_to :genre
  belongs_to :book

  validates :genre_id, uniqueness: { scope: :book_id, message: "should unique category per book" }
end
