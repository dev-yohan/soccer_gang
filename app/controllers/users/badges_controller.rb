class Users::BadgesController < ApplicationController
  before_filter :authenticate_user!

  def index
    gamify = Gamify::Gamify.new
    @badges = gamify.user_badges(ENV['gamify_app_id'], current_user.id)
    @rank20 = gamify.user_ranking(ENV['gamify_app_id'], 1, 20)
  end

end
