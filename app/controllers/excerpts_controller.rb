class ExcerptsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  skip_authorize_resource :only => [:vote_down, :vote_up]
  before_filter :find_resource, :only => [:vote_up, :vote_down]

  def index
    @legend_title = t :excerpts
    @excerpts = Excerpt.order("created_at DESC").page(params[:page])
  end

  def latest
    @legend_title = t :latest
    @excerpts = Excerpt.order('created_at DESC').page(params[:page])
    render 'index'
  end

  def best
    @legend_title = t :best
    @excerpts = Excerpt.order('rating DESC').page(params[:page])
    render 'index'
  end
  
  def new
    @legend_title = t :new_excerpt
    @excerpt = Excerpt.new
  end

  def edit
    @legend_title = t :edit_excerpt
    @excerpt = Excerpt.find params[:id]
  end

  def update
    if @excerpt.update_attributes params[:excerpt]
      redirect_to root_path, :notice => t(:excerpt_updated_successfully)
    else
      render 'edit'
    end
  end

  def create
    @excerpt = current_user.excerpts.new params[:excerpt]
    if @excerpt.save
      #Resque.enqueue(Notifier, @excerpt.id)
      redirect_to excerpts_path, 
                  :notice => t(:excerpt_created_successfully)
    else
      render 'new'
    end
  end
  
  def show
    @show_id = true
  end

  def vote_up
    template = self.vote(@excerpt, :vote_up)
    render template
  end

  def vote_down
    template = self.vote(@excerpt, :vote_down)
    render template
  end

  def vote(excerpt, vote)
    if current_user.send(vote, excerpt)
      return 'rating'
    else
      return 'empty'
    end
  end

  private

  def find_resource
    @excerpt = Excerpt.find params[:id]
  end

end
