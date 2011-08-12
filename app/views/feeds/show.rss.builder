xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title @feed.title
    xml.description @feed.description
    xml.link feed_url(@feed), format: :rss

    @feed.new_items.each do |item|
      xml.item do
        xml.title sanitize(item.title)
        xml.description description_with_link(item)
        xml.pubDate item.created_at.to_s(:rfc822)
        xml.link feed_item_url(item.feed, item, from: 'rss')
        xml.guid feed_item_url(item.feed, item, from: 'rss')
      end
    end
  end
end