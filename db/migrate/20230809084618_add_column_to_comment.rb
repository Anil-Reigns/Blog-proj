class AddColumnToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :comm, :string
    add_column :comments, :blogid, :integer
  end
end
