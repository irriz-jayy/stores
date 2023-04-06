class OrdersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found


    def index
        render json:Order.all, each_serializer: OrderSerializer
    end

    def show
        order=find_order
        render json:order, each_serializer: OrderSerializer, status: :ok
    end

    def create
        order=Order.create!(order_params)
        if order.valid?
            render json:order, each_serializer: OrderSerializer, status: :ok
        else
            render json:order.errors.messages
        end
    end

    def update
        order=find_order
        order.update!(order_params)
        render json:order, each_serializer: OrderSerializer, status: :created
    end

    def destroy
        order=find_order
        order.destroy
        head :no_content
    end

    private
    def record_not_found
        render json: { error: 'Not found' }, status: :not_found
    end

    def find_order
        Order.find(params[:id])
    end

    def order_params
        params.permit(:id,:status,:total,:user_id,:shipping_method_id)
    end

end
