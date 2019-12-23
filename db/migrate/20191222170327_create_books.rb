class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :book_name
      t.string :description
      t.string :author_name
      t.string :rating
      t.string :poster
      t.string :image_file_name

      t.timestamps
    end
  end
end
