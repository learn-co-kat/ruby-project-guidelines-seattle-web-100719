class Add < ActiveRecord::Migration[5.2]
  def change
    add_column :reading_lists, :name, :text
  add_column :reading_lists, :book, :text
  add_column :reading_lists, :author, :text
  end
end
