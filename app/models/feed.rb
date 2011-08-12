class Feed < ActiveRecord::Base
  has_many :items, :dependent => :destroy, :order => 'created_at desc'
end
