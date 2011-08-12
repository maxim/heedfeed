class Item < ActiveRecord::Base
  attr_accessible :title, :description, :link
  belongs_to :feed
end
