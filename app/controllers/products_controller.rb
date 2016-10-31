class ProductsController < ApplicationController
  def index
    @products = Product.where(:onsale => true)
  end

  def show
    @product = Product.find(params[:id])

    unless @product.onsale
      flash[:warning] = "This product is sold out."
      redirect_to root_path
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end

  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path
  end

  def add_to_cart
    @product = Product.find(params[:id])

    if @product.quantity > 0  && !current_cart.cart_items.include?(@product)
      current_cart.add_product_to_cart(@product)
      redirect_to :back
    else
      redirect_to root_path
    end
  end

  private
  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity, :onsale, :image)
  end


end
