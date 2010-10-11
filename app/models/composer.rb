class Composer < ActiveRecord::Base
  has_many :works

   def editions
    works.map {|work| work.editions }.flatten.uniq
   end

  def publishers
    editions.map{|edition| edition.publisher}.uniq
  end
end
