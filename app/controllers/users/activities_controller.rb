class Users::ActivitiesController < ApplicationController
  before_filter :authenticate_user!

  def index
    gamify = Gamify::Gamify.new

    if params[:page].nil?
      page = 1
    else
      page = params[:page]
    end
    if params[:limit].nil?
      limit = 10
    else
      limit = params[:limit]
    end

    @activities = gamify.user_activity_logs(current_user.id, page, limit)

  end

end
