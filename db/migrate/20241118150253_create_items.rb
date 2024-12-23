class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :category
      t.string :location
      t.string :image_url

      t.timestamps
    end
  end
end
