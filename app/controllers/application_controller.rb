# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  layout "base"
  
  
  before_filter :get_customer

  def get_customer
    if session['customer']
      @c = Customer.find(session['customer'])
    end
  end


  private
  def report_error(message)
    @message = message
    render("main/error")
    return false
  end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
