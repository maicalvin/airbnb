class AddPayments < ActiveRecord::Migration[5.2]
    def change
        remove_column :reservations, :payment#Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")    end

add_column :reservations, :payment, :integer
end
end