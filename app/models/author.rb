class Author < ApplicationRecord
  belongs_to :book

  def fullname
    "#{firstname} #{middlename}. #{lastname}"
  end
end
def self.names
  self
end
