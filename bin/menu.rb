# require_relative '../config/environment'

class Menu

    def start
        puts "Welcome to Bibliophilia! What's your name?"
        name = gets.chomp

        puts "Hi #{name}! What would you like to do:"
        new_reader = Reader.find_or_create_reader(name) 
        puts "Press 1 to add a book to your reading list."
        puts "Press 2 to view our tops books."
        puts "Press 3 to see your reading list."
        puts "You read a book! Congrats. Press 4 to update the book's status."
        puts "Press 5 to delete your account." 
        choice = gets.chomp.to_i

        if (choice) == 1
            puts "Please tell me the title of your book."
            title = gets.chomp
            puts "Awesome! Who's the author?"
            author = gets.chomp
            new_book = Book.new_book(title, author)
            ReadingList.new_list(new_reader, new_book)
            puts "Thanks! Your book was added to your reading list."

        elsif (choice) == 2 #prints multiple first books
            puts "Here are our top 15 books!"
            sorted_books = Book.books_sorted[0..14]
                .map { |books| books.pretty_format_extended }
            puts sorted_books
            
        elsif (choice) == 3
            my_list = ReadingList.get_reading_list_by_reader_id(new_reader.id) 
                .map { |book_id| Book.find_book(book_id) }
                .map { |book| book.pretty_format }
            puts my_list

        elsif (choice) == 4 #use find_by method by????????
            puts "Enter the title of a book you've read:"
            book_title = gets.chomp
            book_to_update_id = Book.all.find { |book| book.title == book_title }.id 
            
            variable = ReadingList.all.filter { |list| list.reader_id == new_reader.id} 
                .find { |list| list.book_id == book_to_update_id }
                
            if variable == nil 
                puts "No such book. Go to the library."
            else
                variable.update(shelf: read)
            end 

        elsif (choice) == 5
            Reader.delete(new_reader.id) 
            puts "Your user account has been deleted."
        end 
    end
end