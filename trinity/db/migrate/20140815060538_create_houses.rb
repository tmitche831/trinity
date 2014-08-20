class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :name
      t.string :description
      t.text :images
      t.integer :occupied

      t.timestamps
    end
  end
end
