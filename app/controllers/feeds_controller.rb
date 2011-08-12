class FeedsController < ApplicationController

  def show
    @feed = Feed.find_by_identifier(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @feed }
      format.rss
    end
  end

  def new
    @feed = Feed.new

    respond_to do |format|
      format.html
      format.json { render json: @feed }
    end
  end

  def edit
    @feed = Feed.find_by_identifier(params[:id])
  end

  def create
    @feed = Feed.new(params[:feed])

    respond_to do |format|
      if @feed.save
        format.html { redirect_to @feed, notice: 'Feed was successfully created.' }
        format.json { render json: @feed, status: :created, location: @feed }
      else
        format.html { render action: "new" }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @feed = Feed.find_by_identifier(params[:id])

    respond_to do |format|
      if @feed.update_attributes(params[:feed])
        format.html { redirect_to @feed, notice: 'Feed was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @feed = Feed.find_by_identifier(params[:id])
    @feed.destroy

    respond_to do |format|
      format.html { redirect_to feeds_url }
      format.json { head :ok }
    end
  end
end
