class AddRefererToItems < ActiveRecord::Migration
  def change
    add_column :items, :referer, :string
  end
end
