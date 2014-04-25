class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    if current_user
      redirect_to root_url
    end

    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    Rails.logger.debug "Logging #{@user.document}"

    respond_to do |format|
      if @user.save
        Notifier.registration(@user.name, @user.email).deliver
        notification 'success', {value: "Welcome, #{@user.name}!"}

        format.html { redirect_to root_url }
        format.json { redirect_to @user }
      else
        format.html {
          notification 'error', {value: @user.errors.full_messages.join('<br>')}
          render 'new'
        }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to root_url }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
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
