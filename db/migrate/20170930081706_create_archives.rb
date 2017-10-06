class CreateArchives < ActiveRecord::Migration[5.1]
  def change
    create_table :archives do |t|
      t.string :atitle
      t.string :aurlname

      t.timestamps
    end
  end
end
