class AlterTableItems < ActiveRecord::Migration
  def change
    add_column :items, :detail_url, :string
    add_column :items, :click_url, :string
    add_column :items, :shop_click_url, :string
    add_column :items, :num_iid, :string
    add_column :items, :title, :string
    add_column :items, :nick, :string
    add_column :items, :type, :string
    add_column :items, :desc, :text
    add_column :items, :created, :datetime
    add_column :items, :pic_url, :string
    add_column :items, :num, :integer
    add_column :items, :item_imgs, :text
    add_column :items, :prop_imgs, :text
    add_column :items, :price, :decimal, :default => 0, :precision => 8, :scale => 2
    add_column :items, :coupon_price, :decimal, :decimal => 0, :precision => 8, :scale => 2
    add_column :items, :coupon_rate, :string
    add_column :items, :coupon_start_time, :datetime
    add_column :items, :coupon_end_time, :datetime
    add_column :items, :commission, :string
    add_column :items, :commission_rate, :string
    add_column :items, :commission_num, :string
    add_column :items, :commission_volumn, :string
    add_column :items, :volumn, :integer
    add_column :items, :shop_type, :string

    remove_column :items, :name
    remove_column :items, :summary
  end
end
