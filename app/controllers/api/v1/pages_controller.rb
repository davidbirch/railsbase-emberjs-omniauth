class Api::V1::PagesController < ApplicationController
  respond_to :json # default to Active Model Serializers
  
  def index
    if user_signed_in?
      respond_with Page.all
    else
      respond_with Page.where.not(title: "Secret")
    end    
  end

  def show
    page = Page.find(params[:id])
    if user_signed_in? || !is_page_secret?(page)
      respond_with page
    else
      redirect_to root_url, :alert => "Access denied."
    end
  end
  
  private
  
  def is_page_secret?(page)
    page.title == "Secret"
  end

end
