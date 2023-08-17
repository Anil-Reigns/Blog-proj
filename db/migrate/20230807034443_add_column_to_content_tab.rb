class AddColumnToContentTab < ActiveRecord::Migration[7.0]
  def change
    add_column :contents, :blogid, :integer
  end
end
