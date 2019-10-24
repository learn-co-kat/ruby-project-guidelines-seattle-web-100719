class ReadingList < ActiveRecord::Base

belongs_to :book
belongs_to :reader

def self.new_list
ReadingList.create(book_id, reader_id) #.find_or_create_by --> use this methods to avoid dups
end 

end 