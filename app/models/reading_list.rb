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
        csv_text = File.read("./db/goodreads_library_books.csv")
        booklist = CSV.parse(csv_text, :headers => true)

        booklist.each do |row|
        title = row["Title"]
        author = row["Author"]
        average_rating = row["Average Rating"]
        publisher = row["Publisher"]
        number_of_pages = row["Number of Pages"]
        year_published = row["Year Published"]
        shelf = row["Exclusive Shelf"]
    
    Book.create(title: title, author: author, average_rating: average_rating, publisher: publisher, number_of_pages: number_of_pages, year_published: year_published, shelf: shelf)
end
        
        Reader.create(name: "Jenn")
        Reader.create(name: "Katrina")

        kat_books = Book.all.select { |book| book.id < 155}
        jenn_books = Book.all.select { |book| book.id >154}

        kat_id = Reader.all.find_by(name: "Katrina").id 
        jenn_id = Reader.all.find_by(name: "Katrina").id

        kat_books.each do |book|
            ReadingList.create(book_id: book.id, reader_id: kat_id, shelf: "read")
        end 

        jenn_books.each do |book|
            ReadingList.create(book_id: book.id, reader_id: jenn_id, shelf: "read")
        end 
    end 

end 