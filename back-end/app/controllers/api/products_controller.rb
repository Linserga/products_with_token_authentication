module Api
	class ProductsController < ApplicationController
		before_action :authenticate_user_from_token

		def index
			@products = @current_user.products

			render json: @products
		end

		def create
		 	@product = @current_user.products.build(product_params)

		 	if @product.save
		 		render json: {}
		 	else
		 		render json: {}, status: :unprocessable_entity
		 	end
		end 

		def destroy
			@product = @current_user.products.find_by(id: params[:product_id])
			@product.destroy

			render json: {}
		end

		private 			

			def product_params
				params.require(:product).permit(:name, :quantity, :price)
			end
	end
end