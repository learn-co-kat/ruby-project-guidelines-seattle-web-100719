class RemoveListColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :reading_lists, :name, :text
    remove_column :reading_lists, :book, :text
    remove_column :reading_lists, :author, :text
  end
end
