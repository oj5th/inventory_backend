class Genre < ApplicationRecord
  has_many :book_genres, dependent: :destroy
  has_many :books, through: :book_genres

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  def self.names
    pluck(:name)
  end
end
