class ExcerptsController < ApplicationController
  before_filter :authenticate_user!
  #respond_to :js, :only => [:vote_down, :vote_up]
  load_and_authorize_resource
  skip_authorize_resource :only => [:vote_down, :vote_up]
#  check_authorization :except => [:vote_down, :vote_up]
#  skip_authorization_check :only => [:vote_down, :vote_up]
  
  before_filter :find_resource, :only => [:vote_up, :vote_down]

  def index
    @legend_title = t :excerpts
    @excerpts = Excerpt.order("created_at DESC").page(params[:page])
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
      redirect_to excerpts_path, :notice => t(:excerpt_created_successfully)
    else
      render 'new'
    end
  end

  def vote_up
    #template = self.vote(@excerpt, :vote_up)
    
    if current_user.vote_up @excerpt
      render 'rating'
    else
      render :js => ""
    end
  end

  def vote_down
    if current_user.vote_down @excerpt
      render 'rating'
    else
      render :js => ""
    end
  end

  def vote(excerpt, vote)
    if current_user.send(vote, excerpt)
      return 'rating'
    else
      return ''
    end
  end

  private
  def find_resource
    @excerpt = Excerpt.find params[:id]
  end

end
