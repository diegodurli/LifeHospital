class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :set_model
  skip_before_action :find_record

  def index
  end

  def show
    render_partial 'show'
  end

  def new
    if logged_user
      redirect_to root_url
    end

    @user = User.new
    render_partial 'new'
  end

  def edit
    render_partial 'edit'
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      Notifier.registration(@user.name, @user.email).deliver
      notification 'success', {value: "Welcome, #{@user.name}!"}

      redirect_to root_url
    else
      notification 'error', {value: @user.errors.full_messages.join('<br>')}
      render_partial 'new'
    end
  end

  def update
    if @user.update(user_params)
      notification 'success', {value: "User was successfully updated."}
      render_partial 'edit'
    else
      notification 'error', {value: @user.errors.full_messages.join('<br>')}
      render_partial 'edit'
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    notification 'info', {value: "See you, #{@user.name}!"}
    render js: "window.location = '#{root_url}'"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :document, :phone, :address, :contact, :user_type)
    end

    def get_options_for_user_type_signup_form
      [['Doctor','D'],['Nurse','N'],['Receptionist','R']]
    end

    helper_method :get_options_for_user_type_signup_form
end
