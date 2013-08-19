class AddNodeIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :node_id, :integer
  end
end
