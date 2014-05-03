class SessionsController < ApplicationController
  skip_before_action :set_model
  skip_before_action :find_record

  def new
    if current_user
      redirect_to root_url
    end

    render_partial 'new'
  end

  def create
    @have_errors = false
  	user = User.find_by_email(params[:email])

  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		notification 'success', {value: "Welcome, #{user.name}!"}

  		redirect_to root_url
  	else
      @have_errors = true
  		notification 'error', {value: 'Please, check your credentials.'}
  		render_partial 'new'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	notification 'info', {value: 'You logged out!'}
  	redirect_to root_url
  end
end
