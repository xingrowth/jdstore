class CartsController < ApplicationController
  def clean
    current_cart.clean!
    flash[:warning] = "yiqingkong"
    redirect_to carts_path
  end
end
