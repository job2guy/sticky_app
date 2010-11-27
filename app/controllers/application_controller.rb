# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticationHandling
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  rescue_from ActionController::RoutingError, :with => :render_404


  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
    
  private
  def render_404(exception = nil)
    if exception
        logger.info "Rendering 404: #{exception.message}"
    end
    flash[:notice] = "Please login....."
    redirect_to(login_path)
    #render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end

end
