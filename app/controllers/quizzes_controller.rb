class QuizzesController < ApplicationController
  before_action :basic_auth, only: [:new]
  def index
    session[:source] = Quiz.where(source_id: :number)
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
    if params[:number] == "1" || params[:number] == "2" || params[:number] == "3"
      @id = Quiz.where(source_id: params["number"])
    else
      @id = Quiz.all
    end
    @random1 = @id.order("RAND()").limit(1)
    @random = @id.order("RAND()").first
    @ans = Quiz.where(source_id: params["number"]).where.not(id: @random.id) 
    @answer = @ans.order("RAND()").limit(3).to_a
    @answer.push(@random)
  end

  def answer
    
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

