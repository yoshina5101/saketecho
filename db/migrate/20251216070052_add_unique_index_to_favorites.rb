class AddUniqueIndexToFavorites < ActiveRecord::Migration[7.1]
  def change
    add_index :favorites, %i[user_id beverage_id], unique: true
  end
end
