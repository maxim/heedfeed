class NotificationsController < ApplicationController
  before_filter :find_feed

  def index
    @notifications = @feed.notifications

    respond_to do |format|
      format.rss
    end
  end

  private
  def find_feed
    @feed = Feed.find_by_identifier(params[:feed_id])
  end
end