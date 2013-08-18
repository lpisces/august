class Image < ActiveRecord::Base

  
  mount_uploader :src, ImageUploader
  belongs_to :imageable, :polymorphic => true

end
