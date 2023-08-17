class AddLikesToContent < ActiveRecord::Migration[7.0]
  def change
    add_column :contents, :likes, :integre, default: 0
    
  end
end
