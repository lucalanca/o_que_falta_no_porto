class ProblemsController < ApplicationController
  def index
    @problems = Problem.plusminus_tally
    @problem = Problem.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @problems }
    end
  end

  def show
    @problem = Problem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @problem }
    end
  end

  def create
    @problem = Problem.new(params[:problem])

    respond_to do |format|
      if @problem.save
        format.html { redirect_to problems_url, notice: "Hooray, o teu problema foi submetido." }
      else
        format.html { redirect_to problems_url }
      end
    end
  end

  def thumbs_up
  	@problem = Problem.find(params[:id])

    if @problem.thumbs_up
      respond_to do |format|
        format.json{ render json: @problem, status: 200 }
      end
    else
      respond_to do |format|
        format.json{ render json: @problem, status: 500 }
      end
    end
  end

  def thumbs_down
    @problem = Problem.find(params[:id])
    
    if @problem.thumbs_down
      respond_to do |format|
        format.json{ render json: @problem, status: 200 }
      end
    else
      respond_to do |format|
        format.json{ render json: @problem, status: 500 }
      end
    end
  end
end
