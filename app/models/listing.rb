class Listing < ApplicationRecord
    belongs_to :user
    has_many :reservations, dependent:  :destroy
    mount_uploader :image, ImageUploader
    mount_uploaders :attachments, ImageUploader
validates :image, file_size: { less_than: 10.megabytes }
scope :start_with, ->(name) { where title: name }


end
