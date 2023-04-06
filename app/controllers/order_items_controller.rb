class OrderItemsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found


    def index
        render json:OrderItem.all, each_serializer: OrderItemSerializer
    end

    def show
        orderItem=find_order_items
        render json: orderItem, each_serializer: OrderItemSerializer, status: :ok
    end

    def create
        orderItem=OrderItem.create!(order_items_params)
        if orderItem.valid?
            render json: orderItem, serializer: OrderItemSerializer, status: :created
            else
            render json:orderItem.errors.messages
        end
    end

    def update
        orderItem=find_order_items
        orderItem.update!(order_items_params)
        render json: orderItem, each_serializer: OrderItem, status: :created
    end

    def destroy
        orderItem=find_order_items
        orderItem.destroy
        head :no_content
    end

    private
    def record_not_found
        render json: { error: 'Not found' }, status: :not_found
    end

    def find_order_items
        OrderItem.find(params[:id])
    end

    def order_items_params
        params.permit(:id,:quantity,:price,:order_id,:product_id)
    end

end
