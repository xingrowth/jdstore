class ProductsController < ApplicationController
before_action :authenticate_user! , only: [:new]

  def index
    @products =Product.all
    flash[:notice]="welcome to JD"

  end

  def show
    @product=Product.find(params[:id])
  end
end
