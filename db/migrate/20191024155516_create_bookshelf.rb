class CreateBookshelf < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :shelf, :string
  end
end
