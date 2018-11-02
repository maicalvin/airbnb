class Listing < ApplicationRecord
    belongs_to :user
    mount_uploader :image, ImageUploader
validates :image, file_size: { less_than: 10.megabytes }
end
