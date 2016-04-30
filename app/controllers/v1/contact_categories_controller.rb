module V1
  class ContactCategoriesController < ApplicationController
    before_action :set_category, only: [:show, :update, :destroy]

    include DynamicActionable
    make_list_actions_by CommonStatus, ContactCategory

    def index
      @categories = ContactCategory.all

      respond_with :v1, @categories
    end

    def show
      respond_with :v1, @category
    end

    def create
      @category = ContactCategory.new(category_params)
      @category.save

      respond_with :v1, @category
    end

    def update
      @category.update(category_params)

      respond_with :v1, @category
    end

    def destroy
      @category.inactive!
      @category.save

      respond_with :v1, @category
    end

    private

    def set_category
      @category = ContactCategory.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :email, :status)
    end
  end
end
