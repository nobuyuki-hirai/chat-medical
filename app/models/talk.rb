class Talk < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"

  mount_uploader :image, ImageUploader
end
