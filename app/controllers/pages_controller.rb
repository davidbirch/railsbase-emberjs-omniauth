class PagesController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:home]
 
  def home
  end

  def about
  end
  
  def contact
  end
end
