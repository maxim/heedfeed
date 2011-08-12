class Item < ActiveRecord::Base
  attr_accessible :title, :description, :link
  belongs_to :feed
  before_save :fix_link

  def mark_read(options = {})
    unless read?
      self.referer = parse_referer(options[:from])
      self.read_at = Time.current
      save!
    end
  end

  def read?
    !!read_at
  end

  private
  def fix_link
    fixed_link = link.strip

    unless fixed_link.starts_with?('http://') || fixed_link.starts_with?('https://')
      fixed_link = "http://#{fixed_link}"
    end

    self.link = fixed_link
  end

  def parse_referer(referer = nil)
    ((referer && referer.strip == 'rss') ? 'rss' : 'web')
  end
end
