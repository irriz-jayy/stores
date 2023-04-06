class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    before_action :authorize, only: [:update, :destroy]

    def index
        render json:User.all, each_serializer: UserSerializer
    end

    def show
        user= find_user
        render json:user, each_serializer:UserSerializer, status: :ok
    end

    def create
        user=User.create!(user_params)
        if user.valid?
            render json:user, each_serializer:UserSerializer, status: :created
        else
            render json: user.errors.messages
        end
    end

    def update
        user=find_user
        user.update!(user_params)
        render json:user, each_serializer:UserSerializer, status: :created
    end

    def destroy
        user=find_user
        user.destroy
        head :no_content
    end
    private
    def record_not_found
        render json: { error: 'Not found' }, status: :not_found
    end

    def user_params
        params.permit(:id,:name,:email,:shipping_address,:password)
    end

    def find_user
        User.find(params[:id])
    end

    def authorize
        unless logged_in?
          render json: { error: 'Not authorized' }, status: :unauthorized
        end
    end
    
    def logged_in?
       session[:user_id].present?
    end
end
