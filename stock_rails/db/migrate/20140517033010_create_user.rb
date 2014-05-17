class CreateUser < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string    :account , :unique => true
      t.string    :pwd
      t.integer   :kind
    end
  end
  def self.down
    drop_table :users
  end
end
