class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
    	t.attachment :image
			t.string :title
			t.date :creation_date
			t.integer :qualification
      t.integer :category_id 

			t.index [:title]
      t.index [:qualification]
      t.index [:category_id]
     
			
      t.timestamps
    end
  end
end
