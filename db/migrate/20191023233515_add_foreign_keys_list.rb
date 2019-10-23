class AddForeignKeysList < ActiveRecord::Migration[5.2]
  def change
    add_column :reading_lists, :book_id, :integer
    add_column :reading_lists, :reader_id, :integer
  end
end
