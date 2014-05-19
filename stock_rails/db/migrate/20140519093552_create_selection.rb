class CreateSelection < ActiveRecord::Migration
  def self.up
    create_table :selections do |t|
	t.integer :userid
	t.integer :itemid
    end
  end
  def self.down
    drop_table :selections
  end
end
