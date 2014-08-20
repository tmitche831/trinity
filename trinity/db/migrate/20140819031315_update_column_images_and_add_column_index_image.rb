class UpdateColumnImagesAndAddColumnIndexImage < ActiveRecord::Migration
  def change
    rename_column :houses, :images, :image
    add_column :houses, :index_image, :text
  end
end
