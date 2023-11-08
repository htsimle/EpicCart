class CartController < ApplicationController
    def add_to_cart
      product = Product.find(params[:id])
      if session[:cart_id].nil?
        cart = Cart.create
        session[:cart_id] = cart.id
      else
        cart = Cart.find(session[:cart_id])
      end
  
      cart_item = cart.cart_items.find_by(product_id: product.id)
      if cart_item
        cart_item.update(quantity: cart_item.quantity + 1)
      else
        cart_item = cart.cart_items.build(product: product, quantity: 1)
        cart_item.save
      end
  
      redirect_to products_path, notice: 'Product added to cart'
    end
  
    def show_cart
      @cart = Cart.find(session[:cart_id])
    end
  end
  