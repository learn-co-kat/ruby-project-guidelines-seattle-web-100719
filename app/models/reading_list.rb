require 'pry'
require 'csv'

class ReadingList < ActiveRecord::Base
    belongs_to :book
    belongs_to :reader

    def self.new_list(reader, book)
        ReadingList.create(book_id: book.id, reader_id: reader.id)
    end 

    def self.get_reading_list_by_reader_id(id) 
        self.all
        .filter { |list| list.reader_id == id }
        .map { |mylist| mylist.book_id } 
    end 

    def self.populate_jenn_katrina_books        
        Reader.find_or_create_by(name: "Jenn")
        Reader.find_or_create_by(name: "Katrina")

        kat_books = Book.all.select { |book| book.id < 30 && book.shelf == "to-read"}
        jenn_books = Book.all.select { |book| book.id > 650 && book.shelf == "to-read"}

        kat_id = Reader.all.find_by(name: "Katrina").id 
        jenn_id = Reader.all.find_by(name: "Jenn").id

        kat_books.each do |book|
            ReadingList.create(book_id: book.id, reader_id: kat_id, shelf: "read")
        end 

        jenn_books.each do |book|
            ReadingList.create(book_id: book.id, reader_id: jenn_id, shelf: "read")
        end 
    end 

end 