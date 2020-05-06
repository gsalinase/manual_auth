class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Sign In successfully'
    else
      flash.now[:notice] = 'Email o Password Inválido'
      render action: :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Sign Out successfully'
  end

  private
  def sessions_params
    params.require(:sessions).permit(:email, :password)
  end
end
