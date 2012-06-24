class CreateExcerpts < ActiveRecord::Migration
  def change
    create_table :excerpts do |t|
      t.string :content
      t.integer :rating, :default => 0

      t.timestamps
    end
    add_index :excerpts, :content, :unique => true
  end
end
