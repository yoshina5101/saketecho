class AddUniqueIndexToBeverageMoods < ActiveRecord::Migration[7.1]
  def change
    add_index :beverage_moods, %i[beverage_id mood_id], unique: true
  end
end
