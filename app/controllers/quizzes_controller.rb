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
    total = params[:total].to_i
    number = params[:number].to_i
    session[:number] = number
    session[:total]   = total
    session[:current] = 0
    session[:correct] = 0
    
    redirect_to :action => "answer"

  end

  def question
    @random1 = session[:question]
    @current = session[:current]
    @total   = session[:total]
    @correct = session[:correct]
    @number = session[:number]

    if params[:choice] == @random1[0]["id"].to_s
      @correct += 1
    end
     @current += 1
     redirect_to :action => "answer"

     session[:current] = @current
     session[:total] = @total 
     session[:correct] = @correct
     session[:number] = @number
  end


  def answer
    @current = session[:current]
    @total = session[:total]
    @number = session[:number]
    @correct = session[:correct]
    if @number == 1 || @number == 2 || @number == 3 
      @id = Quiz.where(source_id: @number)
    else
      @id = Quiz.all
    end
    @random1 = @id.order("RAND()").limit(1)
    @random = @id.order("RAND()").first
    @ans = Quiz.where(source_id: @number).where.not(id: @random.id) 
    @answer = @ans.order("RAND()").limit(3).to_a
    @answer.push(@random)

    if @current >= @total
      redirect_to :action => "end"
      return
    end

    session[:question] = @random1
    session[:current] = @current
    session[:total] = @total 
    session[:correct] = @correct
    session[:number] = @number

#   redirect_to answer_quizzes_path, notice: '回答は締め切りました' if @random.limit < Time.current
#     if self.parent.created_at+(self.parent.limit*2) < Time.now
  end

  def end
    @correct = session[:correct]
    @total   = session[:total]
    @current = session[:current]
    
 #   @score = @correct * 100 / @total
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

