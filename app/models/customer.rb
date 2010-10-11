class Customer < ActiveRecord::Base
 has_many :orders, :dependent => true, :order => "created_at ASC"

  def open_orders
    orders.find(:all, :conditions=>"status => 'open'")
  end

  def editions_on_order
    open_orders.map{|o| o.edition}.uniq
  end

  def edition_history
    orders.map{|order| order.edition}.uniq
  end

  def works_on_order
    edition_history.map{|edition| edition.works}.flatten.uniq
  end

  
end
