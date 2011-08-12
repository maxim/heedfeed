module ItemsHelper
  def read_status(item)
    if item.read?
      "read from <strong>#{item.referer}</strong> (#{time_ago_in_words(item.read_at)} ago)".html_safe
    else
      'unread'
    end
  end

  def description_with_link(item)
    html = "<p>Link: #{link_to item.link, feed_item_url(item.feed, item, from: 'rss')}</p>"
    html << sanitize(item.description)

    html.html_safe
  end
end