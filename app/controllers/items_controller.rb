class ItemsController < ApplicationController
  before_filter :find_feed

  def show
    @item = @feed.items.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @item }
    end
  end

  def new
    @item = @feed.items.build

    respond_to do |format|
      format.html
      format.json { render json: @item }
    end
  end

  def edit
    @item = @feed.items.find(params[:id])
  end

  def create
    @item = @feed.items.build(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to [@feed, @item], notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @item = @feed.items.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to [@feed, @item], notice: 'Item was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def find_feed
    @feed = Feed.find(params[:feed_id])
  end
end
