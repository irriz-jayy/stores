class CategoriesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found


    def index
        render json: Category.all, each_serializer: CategorySerializer
    end

    def show
        category=find_category
        render json: category,each_serializer:CategorySerializer,status: :ok
    end

    private
    def find_category
        Category.find(params[:id])
    end

    def record_not_found
        render json: { error: 'Not found' }, status: :not_found
    end
end
