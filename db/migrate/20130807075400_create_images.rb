class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.text :src
      t.integer :imageable_id
      t.string :imageable_type
      t.text :summary

      t.timestamps
    end
  end
end
