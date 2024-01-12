module Api
  module V1
    class SearchController < ApplicationController
      before_action :permit_params
      def index
        @recipes = Recipe.search(params[:ingredients])
      
        render json: @recipes
      end
    
      private

      def permit_params
          ActionController::Parameters.permit_all_parameters = true
      end
    end
  end
end