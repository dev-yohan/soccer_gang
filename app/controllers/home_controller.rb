class HomeController < ApplicationController

  def index
    if !current_user.nil?
      if !current_user.basic_info_wizard?
        redirect_to welcome_step1_path
      elsif !current_user.soccer_skills_wizard?
        redirect_to basic_skills_step2_path
      end
    end
  end


end
