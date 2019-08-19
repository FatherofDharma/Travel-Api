class AddForeignKeyToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :destination_id, :integer
    add_foreign_key :reviews, :destinations
  end
end
