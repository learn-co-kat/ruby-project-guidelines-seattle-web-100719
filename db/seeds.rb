require 'csv'
require 'pry'

csv_text = File.read("./db/goodreads_library_books.csv")

booklist = CSV.parse(csv_text, :headers => true)

booklist.each do |row|
    puts row
end

# booklist.each do |book|
#     Book.create(book.to_h)   
# end 

# require 'csv'    

# csv_text = File.read('...')
# csv = CSV.parse(csv_text, :headers => true)
# csv.each do |row|
#   Moulding.create!(row.to_hash)
# end

binding.pry