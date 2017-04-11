class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index
    @products = Product.order(:title)

    @session_count = session_index_count
  end

  private 

  def session_index_count
    if session[:count].nil?
      session[:count] = 0
    else 
      session[:count] += 1
    end  
  end

end
