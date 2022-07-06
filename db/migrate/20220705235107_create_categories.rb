class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    	t.attachment :image
      t.string :name

      t.index [:name]

      t.timestamps
    end
  end
end
