class ShippingMethodsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
        render json:ShippingMethod.all, each_serializer: ShippingMethodSerializer
    end

    def show
        shipping=find_shipping_method
        render json: shipping, each_serializer: ShippingMethodSerializer, status: :ok
    end

    private
    def record_not_found
        render json: { error: 'Not found' }, status: :not_found
    end
    
    def find_shipping_method
        ShippingMethod.find(params[:id])
    end
end
