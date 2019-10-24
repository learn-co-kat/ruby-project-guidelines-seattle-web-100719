# require_relative '../config/environment'

class Menu

    def start
        puts "Welcome to Bibliophilia! What's your name?"
        name = gets.chomp

        puts "Hi #{name}! What would you like to do:"
        new_reader = Reader.find_or_create_reader(name) 
        puts "Press 1 to add a book to your reading list."
        puts "Press 2 to view our tops books."
        puts "Press 3 to see your new reading list."
        puts "Press 4 if you'd like to see cool stats about our books."
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

        elsif (choice) == 2
            puts "Here are our top 15 books!"
            sorted_books = Book.books_sorted[0..14]
            binding.pry
            
        elsif (choice) == 4

        
        elsif (choice) == 4


        elsif (choice) == 5


        end 
    end
end