class HomesController < ApplicationController

  skip_before_action :authenticate_user!

  def index
    if params[:tag_name].present?
      @poems = Tag.find_by_name(params[:tag_name]).poems
      @short_stories = Tag.find_by_name(params[:tag_name]).short_stories
    else
      @poems = Poem.page(1)
      @short_stories = ShortStory.all
    end

  end

end
