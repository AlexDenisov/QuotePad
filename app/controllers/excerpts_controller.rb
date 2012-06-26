class ExcerptsController < ApplicationController
  before_filter :authenticate_user!
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
    increment = 0
    if current_user.disliked.include? @excerpt
      current_user.disliked.remove @excerpt
      increment = 1
      puts "DISLIKE+"
    elsif not current_user.liked.include? @excerpt
      current_user.liked << @excerpt
      increment = 1
      puts "LIKE"
    end
    @excerpt.increment(:rating, increment) if increment

    respond_to do |format|
      format.js { render 'vote_up' }
    end
#    render 'vote_up'
  end

  def vote_down

  end
  private
  def find_resource
    @excerpt = Excerpt.find params[:id]
  end

  def find_excerpt
    @excerpt = Excerpt.find params[:excerpt_id]
  end

end
