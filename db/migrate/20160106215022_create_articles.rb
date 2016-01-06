class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.string :image_url
      t.integer :staff_id

      t.timestamps null: false
    end
  end
end
