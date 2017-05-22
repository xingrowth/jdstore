class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])

    if @product.quantity < 1
      flash[:alert] = "该商品暂时缺货"
      redirect_to :back
      return
    end

    if current_cart.add_product_to_cart(@product)
      flash[:notice] = "成功加入购物车"
      redirect_to :back
    else
      flash[:warning] = "购物车中已经有该商品"
      redirect_to :back
    end
  end
end
