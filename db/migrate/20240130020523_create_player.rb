class CreatePlayer < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name
      t.boolean :hall_of_fame
      t.integer :games_played
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
