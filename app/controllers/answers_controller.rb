class AnswersController < ApplicationController
	def index
	end

	def new
		@q = Question.where(id: params[:question_id])
	end

	def create
	    p @a = Answer.create(answer: params[:answer][:answer], question_id: params[:question_id])
	    redirect_to root_path
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
