class UpdateColumnOccupiedRenameMaxOccupance < ActiveRecord::Migration
  def change
    rename_column :houses, :occupied, :max_occ
  end
end
