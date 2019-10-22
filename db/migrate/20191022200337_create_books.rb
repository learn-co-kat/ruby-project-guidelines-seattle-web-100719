class CreateBooks < ActiveRecord::Migration[4.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :average_rating
      t.string :publisher
      t.integer :number_of_pages
      t.integer :year_published
      t.string :shelf
      t.date :date_added
    end 
  end
end
