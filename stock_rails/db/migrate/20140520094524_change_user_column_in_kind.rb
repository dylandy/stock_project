class ChangeUserColumnInKind < ActiveRecord::Migration
  def self.up
    change_column :users , :kind , :integer , :limit => 1
  end
  def self.down
    change_column :users , :kind , :integer 
  end
end
