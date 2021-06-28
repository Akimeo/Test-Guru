class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  def new
  end

  def create
    user = User.find_by(name: params[:name])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:path] || root_path
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Name and Password please'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    cookies.delete(:path)
    redirect_to login_path, alert: 'Guru has left us'
  end
end
