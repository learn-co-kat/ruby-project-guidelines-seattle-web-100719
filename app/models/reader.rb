class Reader < ActiveRecord::Base

has_many :reading_lists
has_many :books, through: :reading_lists


end 