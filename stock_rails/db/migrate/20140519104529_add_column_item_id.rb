class AddColumnItemId < ActiveRecord::Migration
  def self.up
    add_column :item_tables , :item_id , :integer , :null => false , :unique => true
  end
  def self.down
    remove_column :item_tables , :item_id
  end
end
