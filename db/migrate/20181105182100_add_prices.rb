class AddPrices < ActiveRecord::Migration[5.2]
    def change
add_column :reservations, :price, :integer
remove_column :reservations, :day#Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")    end
end
end