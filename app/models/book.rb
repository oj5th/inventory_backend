class Book < ApplicationRecord
  has_many :authors, dependent: :destroy
  accepts_nested_attributes_for :authors, :allow_destroy => true
  has_many :book_genres, dependent: :destroy
  has_many :genres, through: :book_genres
  accepts_nested_attributes_for :book_genres, :allow_destroy => true
  scope :find_by_field, ->(field, value){ where("#{field} LIKE '%#{value}%'")}

  validates :isbn, :title, :date_published, presence: true
  # http://nomistakespublishing.com/need-isbn-ebooks/
  # format 978-1-940313-09-2
  # [ISBN]-[COUNTRY-PUBLISHER ID]-[Title Edition and Format ID]-[Check Digit]
  validates :isbn, format: { with: /([0-9]{3})[- \/.]([0-9]{1})[- \/.]([0-9]{6})[- \/.]([0-9]{2})[- \/.]([0-9]{1})/, message: "should be in valid format" }
  validates :isbn, uniqueness: true
end
