class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :summary
      t.string :image_url
      t.integer :user_id
      t.string :genre

      t.timestamps
    end
  end
end
