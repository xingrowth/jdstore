class Cart < ApplicationRecord
  has_many :cart_items
  has_many :products, through: :cart_items, source: :product

  def clean!
    cart_items.destroy_all
  end

  def add_product_to_cart(product,num)
    ci = cart_items.build
    ci.product = product
    ci.quantity = num
    ci.save
  end

  def total_price
    sum = 0
    cart_items.each do |cart_item|
      if cart_item.product.price.present?
        sum += cart_item.quantity * cart_item.product.promotional
      end
    end
    sum
  end
end
