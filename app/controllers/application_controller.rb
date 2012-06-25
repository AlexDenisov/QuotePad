class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :project_metadata

  def project_metadata
    @project_name = "QuotePad"
  end
end
