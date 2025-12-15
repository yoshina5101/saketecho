class CreateTastingLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :tasting_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :beverage, null: false, foreign_key: true
      t.date :tasted_on
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
