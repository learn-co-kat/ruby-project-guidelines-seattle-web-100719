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
    # date_added = row["Date Added"]
    
    Book.create(title: title, author: author, average_rating: average_rating, publisher: publisher, number_of_pages: number_of_pages, year_published: year_published, shelf: shelf)

end

# all_my_books.each do |book|
#     title = book["volumeInfo"]["title"]
#     published_date = book["volumeInfo"]["publishedDate"]
#     desc = book["volumeInfo"]["description"]
#     Book.create(title: title, published_date: published_date , description: desc)
#     # binding.pry
#   end

binding.pry