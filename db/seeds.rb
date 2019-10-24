require 'csv'
require 'pry'

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

csv_reader = File.read("./db/reader_names.csv")
readerlist = CSV.parse(csv_reader, :headers => true)

readerlist.each do |row|
    name = row["Name"]

    Reader.create(name: name)
end 

# binding.pry