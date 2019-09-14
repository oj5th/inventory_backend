class Book < ApplicationRecord
  has_many :authors
  has_many :book_genres, dependent: :destroy
  scope :find_by_field, ->(field, value){ where("#{field} LIKE '%#{value}%'")}

  def author_names
    author_names = self.authors.first(2).collect(&:fullname).join(', ')
    self.authors.count > 2 ? "#{author_names} et al" : author_names
  end

  def genre_categories
    
  end
end
