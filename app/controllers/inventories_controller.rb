class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :edit, :update, :destroy]

  before_action only: [:show, :destroy, :index] do
    is_using_modal?(false)
  end

  before_action only: [:edit, :update, :create, :new] do
    is_using_modal?(true)
  end

  respond_to :html, :json, :js

  def index
    render partial: 'partials/index', locals: {records: find_all}, layout: 'layouts/application'
  end

  def show
  end

  def new
    @inventory = Inventory.new
    render partial: 'partials/new'
  end

  def edit
    render partial: 'partials/edit'
  end

  def create
    @inventory = Inventory.new(inventory_params)

    if @inventory.save
      index_response('created')
    else
      action_error_response('new', @inventory)
    end
  end

  def update
    if @inventory.update(inventory_params)
      index_response('updated')
    else
      action_error_response('edit', @inventory)
    end
  end

  def destroy
    @inventory.destroy
    index_response('deleted')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_params
      params.require(:inventory).permit(:total_value, :document)
    end

    def find_all
      Inventory.order(:id)
    end

    def is_using_modal?(value)
      @using_modal = value
    end

    def index_response(action)
      notification 'success', {value: "Inventory was successfully #{action}."}
      render partial: 'partials/index', locals: {records: find_all}
    end

    def action_error_response(action,record)
      notification 'error', {value: record.errors.full_messages.join('<br>')}
      render partial: "partials/#{action}"
    end
end