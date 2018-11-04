class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :reserve_from  
      t.date :reserve_until
      t.integer :day
      t.references :user, foreign_key: true
      t.references :listing, foreign_key: true

      t.timestamps
    end
  end
end
