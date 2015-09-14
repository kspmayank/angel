class CommentsController < ApplicationController
  def index
  end

  def new
  	@q = Question.where(id: params[:question_id])
    @a = Answer.where(id: params[:answer_id])
  end

  def create
  	p @q = params[:question_id]
    @a = Comment.create(comment: params[:comment][:comment], answer_id: params[:answer_id])
    redirect_to '/questions/#{para:question_id}'
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
