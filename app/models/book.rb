class Book < ActiveRecord::Base

has_many :reading_lists
has_many :readers, through: :reading_lists

def self.new_book(title, author)
    Book.create(title: title, author: author)
end 

end 