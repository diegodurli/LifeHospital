class SerumsController < ApplicationController
  before_action :set_serum, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json, :js

  # GET /serums
  # GET /serums.json
  def index
    @serums = Serum.page(params[:page])
  end

  # GET /serums/1
  # GET /serums/1.json
  def show
  end

  # GET /serums/new
  def new
    @serum = Serum.new
  end

  # GET /serums/1/edit
  def edit
  end

  # POST /serums
  # POST /serums.json
  def create
    @serum = Serum.new(serum_params)

    respond_to do |format|
      if @serum.save
        format.html { redirect_to serums_url, notice: 'Serum was successfully created.' }
        format.js   { redirect_to serums_url }
        format.json { render action: 'show', status: :created, location: serums_url }
      else
        format.html { render action: 'new' }
        format.js   { redirect_to serums_url }
        format.json { render json: @serum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /serums/1
  # PATCH/PUT /serums/1.json
  def update
    respond_to do |format|
      if @serum.update(serum_params)
        format.html { redirect_to serums_url, notice: 'Serum was successfully updated.' }
        format.js   { redirect_to serums_url }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.js   { redirect_to serums_url }
        format.json { render json: @serum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /serums/1
  # DELETE /serums/1.json
  def destroy
    @serum.destroy
    respond_to do |format|
      format.html { redirect_to serums_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_serum
      @serum = Serum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def serum_params
      params.require(:serum).permit(:description)
    end
end
