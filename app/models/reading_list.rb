class ReadingList < ActiveRecord::Base

belongs_to :book
belongs_to :reader

def self.new_list(reader, book)
ReadingList.create(book_id: book.id, reader_id: reader.id) #.find_or_create_by --> use this methods to avoid dups
end 

end 