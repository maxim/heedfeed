class AddReadAtToItems < ActiveRecord::Migration
  def change
    add_column :items, :read_at, :datetime
  end
end
