# require_relative '../config/environment'

class Menu

    def start

        # Reader.destroy_all 
        # Book.destroy_all
        
        puts ""
        puts ""
        puts "--- Welcome to Bibliophilia! ---   "
        puts ""
        puts "What's your name?"
        name = gets.chomp

        puts "Hi #{name}! What would you like to do:"
        new_reader = Reader.find_or_create_reader(name) 

        while true do

            puts ""
            puts "1. Add a book to your reading list."
            puts "2. View our tops books."
            puts "3. See your reading list."
            puts "4. You read a book! Congrats. Update your book's status."
            puts "5. Delete your account." 
            puts "6. Show all readers."
            puts "7. Exit."
            choice = gets.chomp.to_i

            if (choice) == 1
                puts "Please tell me the title of your book."
                title = gets.chomp
                puts "Awesome! Who's the author?"
                author = gets.chomp
                new_book = Book.new_book(title, author)
                ReadingList.new_list(new_reader, new_book)
                puts ""
                puts "Thanks! Your book was added to your reading list."

            elsif (choice) == 2 #prints multiple first books
                puts "Here are our top 15 books!"
                sorted_books = Book.books_sorted[0..14]
                    .map { |books| books.pretty_format_extended }
                puts ""
                puts sorted_books
                
            elsif (choice) == 3
                my_list = ReadingList.get_reading_list_by_reader_id(new_reader.id) 
                    .map { |book_id| Book.find_book(book_id) }
                    .map { |book| book.pretty_format }
                    puts ""
                    puts my_list

            elsif (choice) == 4 #use find_by method by?
                puts "Enter the title of a book you've read:"
                book_title = gets.chomp
                book_to_update_id = Book.all.find { |book| book.title == book_title }.id 
                
                variable = ReadingList.all.filter { |list| list.reader_id == new_reader.id} 
                    .find { |list| list.book_id == book_to_update_id }
                    
                if variable == nil 
                    puts ""
                    puts "No such book. Go to the library."
                else
                    variable.update(shelf: read)
                    puts ""
                    puts "Your reading list has been updated!" #show updated list
                end 

            elsif (choice) == 5
                Reader.delete(new_reader.id) 
                puts "Your user account has been deleted."

            elsif (choice) == 6
                readers = Reader.all.map { |reader| reader.pretty_format }
                puts ""
                puts readers 

            elsif (choice) == 7
                break 
            end 
        end 
    end
end