class AddAttachmentsToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :attachments, :json
  end
end
