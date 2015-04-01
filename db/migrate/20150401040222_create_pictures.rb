class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :title
      t.integer :category, default: 2
      t.attachment :photo
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
