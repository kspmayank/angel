class QuestionsController < ApplicationController
  def index
  end

  def new
    p '1'
    p session[:user_id]
    if session[:user_id] == nil
      redirect_to '/login'
    end
  end

  def create
  	p params[:question][:heading]

  	p @q = Question.create(heading: params[:question][:heading], description: params[:question][:description], user_id: session[:user_id])
  	redirect_to welcome_index_path
  end

  def show
  	@q = Question.where(id: params[:id])
    @a = Answer.where(id: params[:id])
  end

  def edit
  	@q = Question.where(id: params[:id])
  end

  def update
  	@q = Question.where(id: params[:id])
	@u = @q[0].update(heading: params[:question][:heading], description: params[:question][:description])
	redirect_to question_path
  end

  def delete
  end

  def upvote
    Upvote.create(q_id: params[:id])
  end
end
