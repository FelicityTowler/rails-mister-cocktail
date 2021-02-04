class AddReviewstoCocktails < ActiveRecord::Migration[6.0]
  def change
  add_reference :reviews, :cocktail, null: false, foreign_key: true
  add_column :reviews, :rating, :integer
  add_column :reviews, :content, :string
  end
end
