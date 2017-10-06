class CreateBookmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmarks do |t|
      t.string :title
      t.string :urlname
      t.boolean :favourite
      t.boolean :archive

      t.timestamps
    end
  end
end
