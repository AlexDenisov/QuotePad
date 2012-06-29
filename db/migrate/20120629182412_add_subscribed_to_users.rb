class AddSubscribedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :subscribed, :boolean, :default => true
  end
end
