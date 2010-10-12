class Edition < ActiveRecord::Base
  has_and_belongs_to_many :works
  belongs_to :publisher
  has_many :orders
  def before_create
    self.description="standard" unless description
  end

  def composers
     works.map {|work| work.composer }.uniq
   end

  #class methods
   def Edition.of_works(works)
    works.map {|work| work.editions }.flatten.uniq
  end
  
end
