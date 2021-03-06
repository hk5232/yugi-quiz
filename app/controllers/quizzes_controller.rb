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
      render 'new'
    end
  end

  def start
    time = Time.now
    total = params[:total].to_i
    number = params[:number].to_i
    session[:number] = number
    session[:total]   = total
    session[:current] = 0
    session[:correct] = 0
    session[:time] = time
    if params[:quiz_choice].to_i == 1
      redirect_to action: 'answer'
    elsif params[:quiz_choice].to_i == 2
      redirect_to action: 'answer2'
    end
  end

  def question
    @time = session[:time]
    @random1 = session[:question]
    @current = session[:current]
    @total   = session[:total]
    @correct = session[:correct]
    @number = session[:number]

    @correct += 1 if params[:choice] == @random1[0]['id'].to_s
    @current += 1
    redirect_to action: 'answer'

    session[:current] = @current
    session[:total] = @total
    session[:correct] = @correct
    session[:number] = @number
    session[:time] = @time
  end

  def answer
    @limit_time = Time.now
    @time = session[:time]
    @limit = @limit_time.to_time - @time.to_time
    @current = session[:current]
    @total = session[:total]
    @number = session[:number]
    @correct = session[:correct]
    @quiz = if @number == 2 || @number == 3 || @number == 4
              Quiz.where(source_id: @number)
            else
              Quiz.all
            end
    @random1 = @quiz.order('RAND()').limit(1)
    @random = @quiz.order('RAND()').first
    @ans = Quiz.where(source_id: @number).where.not(id: @random.id)
    @answer = @ans.order('RAND()').limit(3).to_a
    @answer.push(@random)

    if @current >= @total || @limit > 30
      redirect_to action: 'end'
      return
    end
    session[:question] = @random1
    session[:current] = @current
    session[:total] = @total
    session[:correct] = @correct
    session[:number] = @number
    session[:time] = @time
  end

  def end
    @correct = session[:correct]
    @total   = session[:total]
    @current = session[:current]
  end

  def question2
    @time = session[:time]
    @random1 = session[:question]
    @current = session[:current]
    @total   = session[:total]
    @correct = session[:correct]
    @number = session[:number]

    @correct += 1 if params[:choice] == @random1[0]['id'].to_s
    @current += 1
    redirect_to action: 'answer2'

    session[:current] = @current
    session[:total] = @total
    session[:correct] = @correct
    session[:number] = @number
    session[:time] = @time
  end

  def answer2
    @limit_time = Time.now
    @time = session[:time]
    @limit = @limit_time.to_time - @time.to_time
    @current = session[:current]
    @total = session[:total]
    @number = session[:number]
    @correct = session[:correct]
    @quiz = if @number == 2 || @number == 3 || @number == 4
              Quiz.where(source_id: @number)
            else
              Quiz.all
            end
    @random1 = @quiz.order('RAND()').limit(1)
    @random = @quiz.order('RAND()').first
    @ans = Quiz.where(source_id: @number).where.not(id: @random.id)
    @answer = @ans.order('RAND()').limit(3).to_a
    @answer.push(@random)

    if @current >= @total || @limit > 30
      redirect_to action: 'end'
      return
    end
    session[:question] = @random1
    session[:current] = @current
    session[:total] = @total
    session[:correct] = @correct
    session[:number] = @number
    session[:time] = @time
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
