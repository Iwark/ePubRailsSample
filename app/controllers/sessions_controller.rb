class SessionsController < ApplicationController
  skip_before_action :check_logined, only: [:new, :create]
  def new
  end

  def create
  	user = User.find_by name:params[:name]
    respond_to do |format|
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        format.html { redirect_to user, notice: 'Logged in!' }
        format.json { render json: user }
      else
        format.html { render 'new' }
        format.json { render json: {"error"=>"Error!"} }
      end
    end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to :root
  end
end
