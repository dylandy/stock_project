class RenameColumnVolumnToVolume < ActiveRecord::Migration
  def self.up
    rename_column :item_tables , :volumn , :volume
  end
  def self.down
    rename_column :item_tables , :volume , :volumn
  end
end
