class CreateMovieCharacters < ActiveRecord::Migration
  def change
    create_table :movie_characters do |t|
    	t.integer :movie_id
    	t.integer :character_id

    	t.index [:movie_id]
    	t.index [:character_id]

    	t.timestamps
    end
  end
end
