class ProductsController < ApplicationController
    layout 'home', only: [:index, :new, :edit, :delete]
    def index
      @products = Product.all
    end
  
    def show
      @product = Product.find(params[:id])
    end
    def new
        @product = Product.new
      end
    
      def create
        @product = Product.new(product_params)
        if @product.save
          redirect_to @product
        else
          render 'new'
        end
      end
    
      def edit
        # Fetch and set @product (the product to edit) in this action.
      end
    
      def update
        # Update the @product instance based on the submitted form data.
      end
    
      def destroy
        # Delete the @product instance.
      end
    
      private
    
      def product_params
        params.require(:product).permit(:name, :description, :price)
      end
  end
  