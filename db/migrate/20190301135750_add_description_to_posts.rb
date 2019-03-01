class AddDescriptionToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :descripcion, :text
    add_column :posts, :created_at, :datetime
    add_column :posts, :updated_at, :datetime  
  end
end
