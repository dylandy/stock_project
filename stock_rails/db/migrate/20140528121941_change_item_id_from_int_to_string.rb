class ChangeItemIdFromIntToString < ActiveRecord::Migration
  def self.up
    change_column :item_tables , :item_id , :string , :null => false , :unique => true
  end
  def self.down
    change_column :item_tables , :item_id , :integer , :null => false , :unique => true
  end
end
