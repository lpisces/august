class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.boolean :highlight
      t.integer :sort

      t.timestamps
    end
  end
end
