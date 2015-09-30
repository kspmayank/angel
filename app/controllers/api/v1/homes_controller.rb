require 'date'
module Api
  module V1
    class HomesController < ApplicationController
      skip_before_filter  :verify_authenticity_token
      respond_to :json
      def index
        @data=[]
        @q = Question.first(10)
        @q.each do |q|
          @question = {}
          CategoryQuestion.where(question_id: q.id).each do |cq|
            @cat = @cat + cq.to_s 
          end
          @question["categories"] = @cat
          @question["date_asked"] = q.created_at.to_date.strftime("%m %b %Y")
          @question[:heading] = q.heading
          @question[:description] = q.description
          @question["images"] = []
          Image.where(question_id: q.id).each do |ai|
             @image = q.image
             @question["images"] << @image
          end
          @u = User.find(q.user_id)
          @question["user"] = {}
          now = Time.now.utc.to_date
          @question["user"][:age] = now.year - @u.dob.year - (@u.dob.to_date.change(:year => now.year) > now ? 1 : 0)
          @question["user"][:gender] = @u.gender
          @question["user"][:pid] = @u.pid
          @question["follwers_count"] = FollowQuestion.where(question_id: q.id).count

          if @a = Answer.where(question_id: q.id).first
            @question["answer"] ={}
            @question["answer"]["answer"] = @a.answer
            @question["answer"]["images"]=[]
            Image.where(answer_id: @a.id).each do |ai|
              @image = ai.image
              @question["answer"]["images"] << @image
            end
            @doc = User.find(@a.user_id)
            @question["answer"]["doctor"] = @doc.name
            @question["answer"]["doctor_profile_pic"] = @doc.photoid
            @question["answer"]["doctor_hospital"] = @doc.hospital
          end
          # no of thanks
          # no of followers
          @data << @question
        end
        respond_with @data
      end
    end
  end
end

# HomeScreen - GET REQUEST(Only Those questions which are already answered/Trending.)
# Question - 
# Answer -XNumber OF AnswerX,
# Marked Effective or not ,Number OF comments,DOC CREDITS.

# Date ,Question,Description,Age,Gender,Random ID,,Number of Followers.,Images Category 
# Answer,,Doctor Name,Doctor Image,Hospital Working In. Images 