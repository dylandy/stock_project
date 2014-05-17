class CreateItemTable < ActiveRecord::Migration
  def self.up
    create_table :item_tables do |t|
      t.string    :name, :unique => true
      t.float     :prev_close
      t.float     :bid
      t.float     :ask
      t.float     :open
      t.float     :close
      t.float     :high
      t.float     :low
      t.integer   :volumn     
    end
  end
  def self.down
    drop_table :item_tables
  end
end
