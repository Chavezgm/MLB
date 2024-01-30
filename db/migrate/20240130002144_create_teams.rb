class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :year_founded
      t.boolean :world_series_appearance

      t.timestamps
    end
  end
end
