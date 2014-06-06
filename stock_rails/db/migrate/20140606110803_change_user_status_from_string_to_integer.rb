class ChangeUserStatusFromStringToInteger < ActiveRecord::Migration
  def self.up
    change_column :users , :status , :integer , :limit => 1
  end
  def self.down
    change_column :users , :status , :string , :limit => 1
  end
end
