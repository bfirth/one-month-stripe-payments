class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :subtitle
      t.string :author
      t.string :author_image_name
      t.decimal :price
      t.string :sku
      t.string :length
      t.string :download_url
      t.string :details
      t.text :description
      t.string :author_description
      t.timestamps
    end
  end
end
