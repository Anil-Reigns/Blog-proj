class AddColumnToContent < ActiveRecord::Migration[7.0]
  def change
    add_column :contents, :author, :string
    add_column :contents, :title, :string
    add_column :contents, :blog, :text
    add_column :contents, :references, :text
  end
end
