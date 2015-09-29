module Api
  module V1
    class HomesController < ApplicationController
      skip_before_filter  :verify_authenticity_token
      respond_to :json
      def index
        respond_with Question.all
      end
    end
  end
end