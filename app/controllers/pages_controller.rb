class PagesController < ApplicationController

  def show
  	if params[:page_id].present?
      render params[:page_id] and return
    else
    	raise 'Wrong page'
    end
  end
end