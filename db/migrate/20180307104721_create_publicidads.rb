class CreatePublicidads < ActiveRecord::Migration[5.1]
  def change
    create_table :publicidads do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.string :publi_url

      t.timestamps
    end
  end
end
