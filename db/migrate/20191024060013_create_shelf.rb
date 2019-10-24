class CreateShelf < ActiveRecord::Migration[5.2]
  def change
    add_column :reading_lists, :shelf, :text
  end
end
