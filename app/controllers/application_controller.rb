class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :get_all_tags

  def get_all_tags
    @tags_list = Tag.all.map{|tag| {id: tag.id, name: tag.name}}.to_json
  end

end
