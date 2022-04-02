class QuizzesController < ApplicationController
  before_action :basic_auth, only: [:new]
  def index
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def start
    @quiz = Quiz.all
  end

private
  
def quiz_params
  params.require(:quiz).permit(:image, :card_name, :question, :attack, :defense, :source_id)
end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_FURIMA_USER'] && password == ENV['BASIC_FURIMA_PASSWORD']
    end
  end
end

