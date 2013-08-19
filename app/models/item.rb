class Item < ActiveRecord::Base

  has_many :images, :as => :imageable

  belongs_to :node

end
