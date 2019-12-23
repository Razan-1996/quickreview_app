class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :book, null: false, foreign_key: true
      t.string :review
      t.string :rating
      t.text :comment

      t.timestamps
    end
  end
end
