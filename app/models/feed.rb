class Feed < ActiveRecord::Base
  has_many :items, dependent: :destroy, order: 'created_at desc'
  has_many :new_items, class_name: 'Item', order: 'created_at desc', limit: 100
  has_many :notifications, class_name: 'Item', conditions: ['read_at is not ?', nil], order: 'read_at desc'


  before_create :set_identifier

  def to_param
    identifier
  end

  private

  def set_identifier
    new_identifier = generate_identifier

    while Feed.exists?(:identifier => new_identifier)
      new_identifier = generate_identifier
    end

    self.identifier = new_identifier
  end

  def generate_identifier
    SecureRandom.hex(10)
  end
end
