class ProfilesController < ApplicationController

  before_action :set_profile, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def exit
    sign_out current_user
    redirect_to :back
  end

  def composers
    if params[:profile_id].present?
      profile = Profile.find(params[:profile_id])
      @poems = profile.user.poems
      @short_stories = profile.user.short_stories
    end
  end

  def update
    respond_to do |format|
      if @profile.update(user_params)
        format.html { redirect_to @profile, notice: 'Poem was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def user_params
    params.require(:profile).permit(:name, :biography)
  end
end
