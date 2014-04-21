class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:email])

  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		notification 'success', {value: 'User logged in successfully.'}
  		redirect_to root_url
  	else
  		notification 'error', {value: 'Please, check your credentials.'}
  		render 'new'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	notification 'info', {value: 'User logged out successfully.'}
  	redirect_to root_url
  end
end
