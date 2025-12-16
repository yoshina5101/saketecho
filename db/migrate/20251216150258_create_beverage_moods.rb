class CreateBeverageMoods < ActiveRecord::Migration[7.1]
  def change
    create_table :beverage_moods do |t|
      t.references :beverage, null: false, foreign_key: true
      t.references :mood, null: false, foreign_key: true

      t.timestamps
    end
  end
end
