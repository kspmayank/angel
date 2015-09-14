class WelcomeController < ApplicationController
  def index
  	@c = Category.all.first(6)
  	@q = Question.all
  	
  end
end
