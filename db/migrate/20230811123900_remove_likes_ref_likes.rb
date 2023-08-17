class RemoveLikesRefLikes < ActiveRecord::Migration[7.0]
  def change
    
    remove_column :contents, :ref_like
  end
end
