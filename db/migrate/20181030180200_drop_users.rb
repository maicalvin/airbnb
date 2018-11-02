class DropUsers < ActiveRecord::Migration[5.2]
    def change
remove_column :users, :birthday
remove_column :users, :gender
add_column :users, :gender, :string
add_column :users, :birthday, :date
    end
end