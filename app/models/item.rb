class Item < ActiveRecord::Base

  has_many :images, :as => :imageable

  belongs_to :node

  def buy_url
    url = ''
    url = detail_url if !detail_url.nil? && detail_url.to_s.strip.size > 0
    url = click_url if !click_url.nil? && click_url.to_s.strip.size > 0
    url
  end

end
