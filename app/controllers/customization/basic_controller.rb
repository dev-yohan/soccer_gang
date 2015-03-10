class Customization::BasicController < ApplicationController
  before_filter :authenticate_user!

  def step_basic_info

  end

end
