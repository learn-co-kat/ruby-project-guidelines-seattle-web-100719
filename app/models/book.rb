class Book < ActiveRecord::Base

has_many :reading_lists
has_many :readers, through: :reading_lists

end 