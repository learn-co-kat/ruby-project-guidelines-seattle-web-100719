class ReadingList < ActiveRecord::Base

    belongs_to :book
    belongs_to :reader

    def self.new_list(reader, book)
    ReadingList.create(book_id: book.id, reader_id: reader.id) #.find_or_create_by --> use this methods to avoid dups
    end 

    def self.get_reading_list_by_reader_id(id) 
        self.all
        .filter { |list| list.reader_id == id }
        .map { |mylist| mylist.book_id } 
    end 
end 