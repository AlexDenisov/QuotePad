class ExcerptsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  def index
    @legend_title = t :excerpts
    @excerpts = Excerpt.order("created_at DESC").page(params[:page])
  end
  
  def new
    @legend_title = t :new_excerpt
    @excerpt = Excerpt.new
  end

  def create
    @excerpt = current_user.excerpts.new params[:excerpt]
    if @excerpt.save
      redirect_to excerpts_path, :notice => t(:excerpt_created_successfully)
    else
      render new_excerpt_path @excerpt
    end
  end
end
