class Removelikescontent < ActiveRecord::Migration[7.0]
  def change
    remove_column :contents, :likes
  end
end
