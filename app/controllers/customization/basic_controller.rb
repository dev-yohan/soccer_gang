class Customization::BasicController < ApplicationController
  before_filter :authenticate_user!

  def step_basic_info
    @user = current_user
  end

  def save_basic_info
    @user = current_user

    if !params[:user_data][:first_name].nil?
      @user.first_name = params[:user_data][:first_name]
    end
    if !params[:user_data][:last_name].nil?
      @user.last_name = params[:user_data][:last_name]
    end
    if !params[:user][:country].nil?
      @user.country = params[:user][:country]
    end

    if @user.save
      @user.basic_info_wizard = true
      @user.save
      @user.report_activity(ENV['gamify_basic_info_activity'])
      redirect_to "/", flash: {success: I18n.t("user_wizard.step_1.step_success")}
    else
      redirect_to welcome_step1_path, flash: {error: I18n.t("user_wizard.step_1.step_error")}
    end
  end

end
