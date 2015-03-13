class Users::BadgesController < ApplicationController
  before_filter :authenticate_user!

  def index
    gamify = Gamify::Gamify.new
    puts gamify.user_badges(ENV['gamify_app_id'], current_user.id)
  end

end
