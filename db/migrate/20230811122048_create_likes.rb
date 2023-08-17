class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :blogid
      t.integer :user_id
      t.integer :ref_like

      t.timestamps
    end
  end
end
