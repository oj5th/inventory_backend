class Book < ApplicationRecord
  has_many :authors, dependent: :destroy
  accepts_nested_attributes_for :authors, :allow_destroy => true
  has_many :book_genres, dependent: :destroy
  has_many :genres, through: :book_genres
  scope :find_by_field, ->(field, value){ where("#{field} LIKE '%#{value}%'")}

  validates :isbn, :title, :date_published, presence: true
  validates :isbn, uniqueness: true
end
