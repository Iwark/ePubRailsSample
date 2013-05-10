class WelcomeController < ApplicationController
	skip_before_action :check_logined
	before_action :welcome_logined
  def index
  	@user = User.new
  	respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  private
  def welcome_logined
		redirect_to current_user if current_user
	end
end
