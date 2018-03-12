class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :titulo
      t.text :descripticion
      t.string :img_destacada_url
      t.date :fecha

      t.timestamps
    end
  end
end
