class Customization::SkillsController < ApplicationController
  before_filter :authenticate_user!

  def step_basic_skills
    @user = current_user
    @positions = Soccer::Position.all
  end

end
