class RemoveColumnFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users , :account
    remove_column :users , :pwd
    remove_column :users , :status
    remove_column :users , :kind
  end
  def self.down
    add_column :users , :account , :string
    add_column :users , :pwd , :string
    add_column :users , :kind , :integer , :limit => 1
    add_column :users , :status , :integer  , :limit => 1
  end
end
