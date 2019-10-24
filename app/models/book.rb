require 'pry'

class Book < ActiveRecord::Base

    has_many :reading_lists
    has_many :readers, through: :reading_lists

    def self.new_book(title, author)
        Book.create(title: title, author: author)
    end

    def self.books_sorted
        Book.all
        .filter { |book| book.average_rating != nil }
        .sort { |book1, book2| book2.average_rating <=> book1.average_rating }
    end 

end 