xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Notifications for #{@feed.title}"
    xml.description "See when #{@feed.title} was read"
    xml.link feed_notifications_url(@feed), format: :rss

    @notifications.each do |item|
      xml.item do
        xml.title "Been opened: #{sanitize(item.title)}"
        xml.description "The item named \"#{sanitize(item.title)}\" (#{link_to item.link}) has been opened from <strong>#{item.referer}</strong>."
        xml.pubDate item.read_at.to_s(:rfc822)
        xml.link feed_url(item.feed)
        xml.guid feed_item_url(item.feed, item, from: 'rss')
      end
    end
  end
end