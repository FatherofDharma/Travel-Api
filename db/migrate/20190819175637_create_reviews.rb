class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :user_name
      t.integer :rating
      t.text :content

      t.timestamps
    end
  end
end
