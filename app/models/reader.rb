class Reader < ActiveRecord::Base

has_many :reading_lists
has_many :books, through: :reading_lists

def self.find_or_create_reader(name)
Reader.find_or_create_by(name: name)
end 

def pretty_format
    "#{name}"
end

end 