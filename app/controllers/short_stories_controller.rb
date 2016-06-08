class ShortStoriesController < ApplicationController
  before_action :set_short_story, only: [:show, :edit, :update, :destroy]

  skip_before_action :authenticate_user!, only: [:show, :index]

  # GET /short_stories
  # GET /short_stories.json
  def index
    if params[:profile_id].present?
      @short_stories = Profile.find(params[:profile_id]).user.short_stories.page(params[:page])
    else
      @short_stories = current_user.present? ? current_user.short_stories.page(params[:page]) : ShortStory.all.page(params[:page])
    end
  end

  # GET /short_stories/1
  # GET /short_stories/1.json
  def show
  end

  # GET /short_stories/new
  def new
    @short_story = ShortStory.new
  end

  # GET /short_stories/1/edit
  def edit
  end

  # POST /short_stories
  # POST /short_stories.json
  def create
    @short_story = ShortStory.new(short_story_params)
    @short_story.user = current_user

    if params[:tags_id].present?
      arr = params[:tags_id].split(',')
      @short_story.tags = Tag.find(arr)
    end

    respond_to do |format|
      if @short_story.save
        format.html { redirect_to @short_story, notice: 'Short story was successfully created.' }
        format.json { render :show, status: :created, location: @short_story }
      else
        format.html { render :new }
        format.json { render json: @short_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /short_stories/1
  # PATCH/PUT /short_stories/1.json
  def update

    if params[:tags_id].present?
      arr = params[:tags_id].split(',')
      @short_story.tags = Tag.find(arr)
    end
    respond_to do |format|
      if @short_story.update(short_story_params)
        format.html { redirect_to @short_story, notice: 'Short story was successfully updated.' }
        format.json { render :show, status: :ok, location: @short_story }
      else
        format.html { render :edit }
        format.json { render json: @short_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /short_stories/1
  # DELETE /short_stories/1.json
  def destroy
    @short_story.destroy
    respond_to do |format|
      format.html { redirect_to short_stories_url, notice: 'Short story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_short_story
      @short_story = ShortStory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def short_story_params
      params.require(:short_story).permit(:title, :content, :short_description)
    end
end
