class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :name
      t.string :sport
      t.string :location
      t.integer :current_players
      t.integer :max_players
      t.text :description
      t.references :host, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
