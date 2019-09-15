class Author < ApplicationRecord
  belongs_to :book

  validates :firstname,  :middlename, :lastname, presence: true

  def self.names
    count > 2 ? etal_names : all_names
  end
  
  def self.etal_names
    pluck(:firstname, :middlename, :lastname).first(2).map { |firstname, middlename, lastname| "#{firstname} #{middlename[0]}. #{lastname}" }.join(', ').concat(" et al")
  end

  def self.all_names
    pluck(:firstname, :middlename, :lastname).map { |firstname, middlename, lastname| "#{firstname} #{middlename[0]}. #{lastname}" }.join(', ')
  end
end
