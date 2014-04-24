class PagesController < ApplicationController
	skip_before_filter :authenticate

  def index
  end

  def routing_error
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404.html", status: 404, :layout => false }
    end
  end
end
