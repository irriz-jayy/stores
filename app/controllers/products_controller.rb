class ProductsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
        render json:Product.all, each_serializer: ProductSerializer
    end

    def show
        product=find_product
        render json:product, each_serializer: ProductSerializer, status: :ok
    end

    def create
        product=Product.create!(product_params)
        if product.valid?
            render json:product, each_serializer:ProductSerializer, status: :created
        else
            render json: product.errors.messages
        end
    end

    def update
        product=find_product
        product.update!(product_params)
        render json: product, each_serializer: ProductSerializer, status: :created
    end

    def destroy
        product=find_product
        product.destroy
        head :no_content
    end

    private
    def find_product
        Product.find(params[:id])
    end

    def product_params
        params.permit(:id,:name,:price,:image_url,:category_id)
    end

    def record_not_found
        render json: { error: 'Not found' }, status: :not_found
    end
end
