class Book < ActiveRecord::Base

has_many :reading_lists
has_many :readers, through: :reading_lists

def self.new_book(title, author)
    newb = Book.create(title: title, author: author)
    ReadingList.create(newb)
end 

end 