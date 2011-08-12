class AddIdentifierToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :identifier, :string
    add_index :feeds, :identifier, :unique => true
  end
end