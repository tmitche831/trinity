class UpdateColumnDescriptionToText < ActiveRecord::Migration
  def change
    change_column :houses, :description, :text
  end
end
