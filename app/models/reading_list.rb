class ReadingList < ActiveRecord::Base

belongs_to :book
belongs_to :reader

def self.new_list(name, author, book)
ReadingList.create(name: name, author: author, book: book)
end 

end 