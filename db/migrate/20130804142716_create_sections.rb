class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.integer :sort
      t.string :summary

      t.timestamps
    end
  end
end
