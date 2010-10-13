class CustomerController < ApplicationController
  helper :composer, :work, :edition
  
  
  before_filter :authorize,    :except => ["signup","login"]
  before_filter :new_customer, :only   => ["signup"]

  def authorize
    return true if @c
    report_error("Unauthorized access; password required")
  end

  def new_customer
    if Customer.find_by_nick(params[:customer][:nick])
      report_error("That name is already in use.  Please choose another.")
    elsif Customer.find_by_email(params[:customer][:email])
      report_error("Account already exists for that email adress")
    end
  end

  def signup
    c = Customer.new(params[:customer])
    c.password = Digest::SHA1.hexdigest(c.password)
    c.save
    session['customer'] = c.id
    redirect_to :controller => "main", :action => "welcome"
  end

  def login
    pw,nick = params[:customer].values_at(*%w{password nick})
    c = Customer.find_by_nick(nick)
    if c && Digest::SHA1.hexdigest(pw) == c.password
      session['customer'] = c.id
      redirect_to :controller => "main", :action => "welcome"
    else
      report_error("Invalid login #{nick} #{pw}")
    end
  end

  def logout
    session['customer'] = nil
    redirect_to :controller => "main", :action => "welcome"
  end 

  def add_to_cart
    e = Edition.find(params[:id])
    order = Order.create(:customer => @c,
                         :edition  => e)
    if order
      redirect_to :action => "view_cart"
    else 
      report_error("Trouble with saving order")
    end
  end

  def view_cart
  end

  def check_out
    @c.check_out
  end
  
 
end
