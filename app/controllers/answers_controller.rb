require 'net/http'
require 'open-uri'
class AnswersController < ApplicationController
	def index
		url = URI.parse('http://developer.goibibo.com/api/voyager/get_hotels_by_cityid/?app_id=432d85a4&app_key=f3088ce10d4b218d28d4355d03e9ca1f&city_id=6771549831164675055')
		req = Net::HTTP::Get.new(url.to_s)
		res = Net::HTTP.start(url.host, url.port) {|http|
		  http.request(req)
		}
		puts res.body
	end

	def new
		@q = Question.where(id: params[:question_id])
	end

	def create
	    p @a = Answer.create(answer: params[:answer][:answer], question_id: params[:question_id])
	    @img = []
		params["answer"]["file"].each do |f|
			uploaded_file = f
			file_content = uploaded_file.read
			p file_content
			p @img << Base64.encode64(file_content)
			Image.create(image: @img, answer_id: @a.id)
		end
	    redirect_to root_path
	end

	def abc
		@img = []
		params["answer"]["file"].each do |f|
			uploaded_file = f
			file_content = uploaded_file.read
			 file_content
			 @img << Base64.encode64(file_content)
		end
	end

	def show
		
	end

	def edit
	end

	def update
	end

	def delete
	end
end
