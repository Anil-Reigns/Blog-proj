class AddCategoryToContent < ActiveRecord::Migration[7.0]
  def change
    add_column :contents, :category, :string
  end
end
