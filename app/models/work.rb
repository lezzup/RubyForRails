class Work < ActiveRecord::Base
  belongs_to :composer
  has_and_belongs_to_many :editions,  :order => "year ASC"
  has_and_belongs_to_many  :instruments

  def publishers
    self.editions.map{|e| e.publisher.name}.uniq
  end

  def country
    composer.country
  end

  def orders_by
    editions.map{|e| e.orders}.flatten.map{|o| o.customer}.uniq
  end

  def key
    kee
  end

end
