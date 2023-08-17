class AddRefLikeContent < ActiveRecord::Migration[7.0]
  def change
    add_column :contents, :ref_like, :integer, default: 0
  end
end
