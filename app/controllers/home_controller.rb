class HomeController < ApplicationController

  def index
    if !current_user.nil?
      if !current_user.basic_info_wizard?
        redirect_to welcome_step1_path
      end
    end
  end


end
