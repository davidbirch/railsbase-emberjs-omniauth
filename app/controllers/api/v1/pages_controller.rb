class Api::V1::PagesController < ApplicationController
  respond_to :json # default to Active Model Serializers
  
  def index
    respond_with Page.all
  end

  def show
    respond_with Page.find(params[:id])
  end

end
