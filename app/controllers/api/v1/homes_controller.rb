module Api
  module V1
    class HomesController < ApplicationController
      skip_before_filter  :verify_authenticity_token
      respond_to :json
      def index
        @data={}
        @q = Question.first(10)
        @q.each do |q|
          @data["#{q.id}"] = {}
          @data["#{q.id}"][:heading] = q.heading
          @data["#{q.id}"][:description] = q.description
          @u = User.find(q.user_id)
          @data["#{q.id}"]["#{@u.id}"] = {}
          @data["#{q.id}"]["#{@u.id}"][:age] = @u.dob
          #@data["#{q.id}"]["#{@u.id}"][:gender] = @u.gender
          @data["#{q.id}"]["#{@u.id}"][:pid] = @u.pid
          # no of thanks
          # no of followers
        end
        respond_with @data
      end
    end
  end
end

# HomeScreen - GET REQUEST(Only Those questions which are already answered/Trending.)
# Question - Category ,Date ,Question,Description,Images,Age,Gender,Random ID,Number of Followers.
# Answer -Number OF Answer,Number OF Followers,Answer, Images ,Doctor Name,Doctor Image,Hospital Working In.
# Marked Effective or not ,Number OF comments,DOC CREDITS.