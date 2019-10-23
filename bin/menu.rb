# require_relative '../config/environment'

class Menu

    def start
        puts "Welcome to Bibliophilia! What's your name?"
        name = gets.chomp

        puts "Hi #{name}! What would you like to do:"
        Reader.new_reader(name) 
        puts "Press 1 to add a book to your reading list."
        puts "Press 2 to add one of our tops books to your reading list."
        puts "Press 3 to see your new reading list."
        puts "Press 4 if you'd like to see cool stats about our books."
        puts "Press 5 to delete your account." 
        choice = gets.chomp.to_i

        if (choice) == 1
            puts "Please tell me the title of your book."
            title = gets.chomp
            puts "Awesome! Who's the author?"
            author = gets.chomp
            Book.new_book(title, author)
            puts "Thanks! Your book was added to your reading list."

        elsif (choice) == 2
            puts "You chose 2!"
        
        elsif (choice) == 4
            puts "You chose 3!"
        
        elsif (choice) == 4
            puts "You chose 4!"

        elsif (choice) == 5
            puts "You chose 5!"

        end 
    end
end