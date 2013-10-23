class CreateMoviesTable < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :year, null: false
      t.string :imdbid, null: false
      t.string :type, null: false

      t.timestamps
    end
end
end

