class DeleteColumnBooks2 < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :date_added
  end
end
