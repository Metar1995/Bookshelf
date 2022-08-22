class AddColumnToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :info, :text
  end
end
