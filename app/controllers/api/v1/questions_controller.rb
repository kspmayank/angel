module Api
  module V1
    class QuestionsController < ApplicationController
      skip_before_filter  :verify_authenticity_token
      respond_to :json
      def index
        respond_with Question.all
      end
      
      def show
        respond_with Question.find(params[:id])
      end
      
      def create
        #skip_before_filter  :verify_authenticity_token
        respond_with Question.create(heading: params[:heading], description: params[:description])
      end
      
      def update
        respond_with Question.update(heading: params[:heading], description: params[:description])
      end
      
      def destroy
        respond_with Question.destroy(params[:id])
      end
    end
  end
end