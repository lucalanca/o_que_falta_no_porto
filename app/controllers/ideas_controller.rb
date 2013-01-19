class IdeasController < ApplicationController
  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all
    @idea = Idea.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ideas }
    end
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @idea = Idea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @idea }
    end
  end

  # POST /ideas
  def create
    @idea = Idea.new(params[:idea])

    respond_to do |format|
      if @idea.save
        format.html { redirect_to ideas_url, notice: 'Idea was successfully created.' }
      else
        format.html { redirect_to ideas_url }
      end
    end
  end

  # POST /ideas/1/thumbs_up
  def thumbs_up
  	@idea = Idea.find(params[:id])

    if @idea.thumbs_up
      respond_to do |format|
        format.json{ render json: @idea, status: 200 }
      end
    else
      respond_to do |format|
        format.json{ render json: @idea, status: 500 }
      end
    end
  end

  # POST /ideas/1/thumbs_up
  def thumbs_down
    @idea = Idea.find(params[:id])
    logger.debug params.to_s
    logger.debug "THUMBS DOWN #{@idea.to_s}"
    if @idea.thumbs_down
      respond_to do |format|
        format.json{ render json: @idea, status: 200 }
      end
    else
      respond_to do |format|
        format.json{ render json: @idea, status: 500 }
      end
    end
  end
end
