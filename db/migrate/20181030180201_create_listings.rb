class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
          t.string :address
          t.string :tag
          t.string :title
          t.string :feature
          t.integer :num_room
          t.integer :price
          t.integer :num_bed
          t.integer :num_bath  
          t.integer :num_people
      t.timestamps
    end
  end
end
