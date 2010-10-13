class Customer < ActiveRecord::Base
 has_many :orders, :dependent => :nullify, :order => "created_at ASC"

  def open_orders
    orders.find(:all, :conditions=>{:status => "open"})
  end

  def editions_on_order
    open_orders.map{|o| o.edition}.uniq
  end

  def edition_history
    orders.map{|order| order.edition}.uniq
  end

  def works_on_order
    editions_on_order.map {|edition| edition.works }.flatten.uniq
  end

  def work_history
    edition_history.map {|edition| edition.works }.flatten.uniq
  end

   def rank(list)
    list.uniq.sort_by do |a|
      list.select {|b| a == b }.size
    end.reverse
  end

  def composer_rankings
    rank(edition_history.map {|ed| ed.composers }.flatten)
  end

  def instrument_rankings
    rank(work_history.map {|work| work.instruments }.flatten)
  end

  def copies_of (edition)
    open_orders.select { |order| order.edition==edition }.size
  end

  def balance
    editions_on_order.inject(0) {|acc,edition| acc += edition.price }
  end

  def check_out
    orders.each do |order|
      order.update_attributes(:status => "paid")
    end
  end

  
end
