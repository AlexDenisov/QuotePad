class AddAuthorIdToExcerpts < ActiveRecord::Migration
  def change
    add_column :excerpts, :user_id, :integer
  end
end
