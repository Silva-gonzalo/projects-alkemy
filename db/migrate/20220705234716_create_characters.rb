class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
    	t.attachment :image
      t.string :name
      t.integer :age
      t.float :weight
      t.text :history


      t.index [:name]

      t.timestamps
    end
  end
end
